import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../core/utils/amount_formatter.dart';
import '../../core/utils/date_utils.dart';
import '../../core/utils/weight_formatter.dart';
import '../../domain/entities/transaction_entity.dart';
import '../models/export_options.dart';
import '../repositories/account_repository.dart';
import '../repositories/transaction_repository.dart';

/// Exports filtered transactions to PDF or Excel-compatible CSV.
class DataExportService {
  DataExportService(this._transactionRepository, this._accountRepository);

  final TransactionRepository _transactionRepository;
  final AccountRepository _accountRepository;

  Future<List<TransactionEntity>> fetchFiltered(ExportOptions options) async {
    final transactions = await _transactionRepository.getAll();
    return _applyFilters(transactions, options);
  }

  Future<Map<int, String>> accountNameMap() async {
    final accounts = await _accountRepository.getAll();
    return {
      for (final account in accounts)
        if (account.id != null) account.id!: account.entryName,
    };
  }

  List<TransactionEntity> _applyFilters(
    List<TransactionEntity> transactions,
    ExportOptions options,
  ) {
    return transactions.where((transaction) {
      if (transaction.isTransfer) return false;

      switch (options.recordType) {
        case ExportRecordTypeFilter.money:
          if (transaction.isGrain) return false;
        case ExportRecordTypeFilter.grain:
          if (!transaction.isGrain) return false;
        case ExportRecordTypeFilter.both:
          break;
      }

      switch (options.transactionType) {
        case ExportTransactionTypeFilter.expense:
          if (!transaction.isExpense && !transaction.isGrainOut) return false;
        case ExportTransactionTypeFilter.income:
          if (!transaction.isIncome && !transaction.isGrainIn) return false;
        case ExportTransactionTypeFilter.both:
          break;
      }

      if (!options.allAccounts &&
          !options.accountIds.contains(transaction.accountId)) {
        return false;
      }

      if (!options.allDates) {
        final parsed = CashBookDateUtils.parseDate(transaction.date);
        if (parsed != null) {
          final dateOnly = DateTime(parsed.year, parsed.month, parsed.day);
          if (options.startDate != null) {
            final start = DateTime(
              options.startDate!.year,
              options.startDate!.month,
              options.startDate!.day,
            );
            if (dateOnly.isBefore(start)) return false;
          }
          if (options.endDate != null) {
            final end = DateTime(
              options.endDate!.year,
              options.endDate!.month,
              options.endDate!.day,
            );
            if (dateOnly.isAfter(end)) return false;
          }
        }
      }

      return true;
    }).toList();
  }

  Future<Uint8List> generatePdf({
    required List<TransactionEntity> transactions,
    required Map<int, String> accountNames,
    required ExportOptions options,
  }) async {
    final rows = _buildRows(transactions, accountNames);
    final pdf = pw.Document();
    final generatedAt = DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now());

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: const pw.EdgeInsets.all(24),
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Text(
              'Transaction Export',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Text('Generated: $generatedAt'),
          pw.Text(
            'Filters: ${options.transactionType.label} | '
            '${options.recordType.label} | '
            '${options.allAccounts ? 'All accounts' : '${options.accountIds.length} account(s)'} | '
            '${options.dateRangeLabel}',
          ),
          pw.SizedBox(height: 16),
          if (rows.isEmpty)
            pw.Text('No transactions match the selected filters.')
          else
            pw.TableHelper.fromTextArray(
              headers: _headers,
              data: rows,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              cellAlignment: pw.Alignment.centerLeft,
              headerDecoration: const pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
              cellHeight: 24,
              cellStyle: const pw.TextStyle(fontSize: 9),
            ),
        ],
      ),
    );

    return pdf.save();
  }

  Future<Uint8List> generateExcelCsv({
    required List<TransactionEntity> transactions,
    required Map<int, String> accountNames,
  }) async {
    final buffer = StringBuffer();
    buffer.writeln(_headers.map(_escapeCsv).join(','));
    for (final row in _buildRows(transactions, accountNames)) {
      buffer.writeln(row.map(_escapeCsv).join(','));
    }
    return Uint8List.fromList(utf8.encode(buffer.toString()));
  }

  static const _headers = [
    'Date',
    'Time',
    'Type',
    'Account',
    'Name',
    'Category',
    'Amount',
    'Payment Mode',
    'Remark',
  ];

  List<List<String>> _buildRows(
    List<TransactionEntity> transactions,
    Map<int, String> accountNames,
  ) {
    return transactions
        .map(
          (transaction) => [
            transaction.date,
            transaction.time,
            _typeLabel(transaction),
            accountNames[transaction.accountId] ?? 'Account ${transaction.accountId}',
            transaction.name,
            transaction.category,
            _amountLabel(transaction),
            transaction.paymentMode,
            transaction.remark,
          ],
        )
        .toList();
  }

  String _typeLabel(TransactionEntity transaction) {
    if (transaction.isGrain) {
      if (transaction.isGrainOut) return 'Grain OUT';
      if (transaction.isGrainIn) return 'Grain IN';
      return 'Grain';
    }
    if (transaction.type.isEmpty) return 'Unknown';
    return transaction.type[0].toUpperCase() + transaction.type.substring(1);
  }

  String _amountLabel(TransactionEntity transaction) {
    if (transaction.isGrain) return WeightFormatter.format(transaction.amount);
    return AmountFormatter.format(transaction.amount);
  }

  String _escapeCsv(String value) {
    if (value.contains(',') || value.contains('"') || value.contains('\n')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }
}
