import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:expense_tracker/core/utils/amount_formatter.dart';
import 'package:expense_tracker/core/utils/date_utils.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/repositories/account_repository.dart';
import 'package:expense_tracker/data/repositories/transaction_repository.dart';
import 'package:expense_tracker/domain/entities/transaction_entity.dart';

void main() {
  late AppDatabase database;
  late TransactionRepository transactionRepo;
  late AccountRepository accountRepo;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    transactionRepo = TransactionRepository(database);
    accountRepo = AccountRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  group('AmountFormatter', () {
    test('converts storage amount to display amount', () {
      expect(AmountFormatter.toDisplayAmount(300000), 3000.0);
      expect(AmountFormatter.toStorageAmount(3000.0), 300000);
    });

    test('formats currency string', () {
      expect(AmountFormatter.format(9000), contains('90'));
    });
  });

  group('CashBookDateUtils', () {
    test('parses CashBook date format', () {
      final date = CashBookDateUtils.parseDate('10 Nov 2025');
      expect(date, isNotNull);
      expect(date!.year, 2025);
      expect(date.month, 11);
      expect(date.day, 10);
    });

    test('formats date correctly', () {
      final formatted = CashBookDateUtils.formatDate(DateTime(2025, 11, 10));
      expect(formatted, '10 Nov 2025');
    });
  });

  group('TransactionRepository', () {
    test('inserts and retrieves transaction', () async {
      final accountId = await accountRepo.insert(
        AccountEntity(
          entryName: 'Test Account',
          dateTime: CashBookDateUtils.formatDateTime(DateTime.now()),
        ),
      );

      final txId = await transactionRepo.insert(
        TransactionEntity(
          accountId: accountId,
          categoryId: 0,
          date: '10 Nov 2025',
          time: '05:19',
          amount: 300000,
          name: 'Test Expense',
          category: 'Food',
          remark: 'Test remark',
          paymentMode: 'Cash',
          lastEditedDate: '10 Nov 2025',
          lastEditedTime: '05:19',
          imageUris: '[]',
          type: 'expense',
          isHeader: 0,
        ),
      );

      expect(txId, greaterThan(0));

      final tx = await transactionRepo.getById(txId);
      expect(tx, isNotNull);
      expect(tx!.name, 'Test Expense');
      expect(tx.amount, 300000);
      expect(tx.type, 'expense');
    });

    test('searches transactions by query', () async {
      final accountId = await accountRepo.insert(
        AccountEntity(
          entryName: 'Cash',
          dateTime: CashBookDateUtils.formatDateTime(DateTime.now()),
        ),
      );

      await transactionRepo.insert(
        TransactionEntity(
          accountId: accountId,
          categoryId: 0,
          date: '10 Nov 2025',
          time: '05:19',
          amount: 500000,
          name: 'Groceries shopping',
          category: 'Groceries',
          remark: '',
          paymentMode: 'Online',
          lastEditedDate: '10 Nov 2025',
          lastEditedTime: '05:19',
          imageUris: '[]',
          type: 'expense',
          isHeader: 0,
        ),
      );

      final results = await transactionRepo.search(
        const SearchFilter(query: 'Groceries'),
      );
      expect(results, hasLength(1));
      expect(results.first.name, 'Groceries shopping');
    });

    test('sorts transactions by date and time newest first', () async {
      final accountId = await accountRepo.insert(
        AccountEntity(
          entryName: 'Cash',
          dateTime: CashBookDateUtils.formatDateTime(DateTime.now()),
        ),
      );

      await transactionRepo.insert(
        TransactionEntity(
          accountId: accountId,
          categoryId: 0,
          date: '01 Jan 2025',
          time: '10:00',
          amount: 10000,
          name: 'Older',
          category: '',
          remark: '',
          paymentMode: 'Cash',
          lastEditedDate: '16 Jul 2026',
          lastEditedTime: '10:00',
          imageUris: '[]',
          type: 'expense',
          isHeader: 0,
        ),
      );

      await transactionRepo.insert(
        TransactionEntity(
          accountId: accountId,
          categoryId: 0,
          date: '16 Jul 2026',
          time: '09:00',
          amount: 20000,
          name: 'Newer',
          category: '',
          remark: '',
          paymentMode: 'Cash',
          lastEditedDate: '01 Jan 2025',
          lastEditedTime: '09:00',
          imageUris: '[]',
          type: 'expense',
          isHeader: 0,
        ),
      );

      final transactions = await transactionRepo.getAll();
      expect(transactions.first.name, 'Newer');
      expect(transactions.last.name, 'Older');
    });

    test('toggles bookmark', () async {
      final accountId = await accountRepo.insert(
        AccountEntity(
          entryName: 'Cash',
          dateTime: CashBookDateUtils.formatDateTime(DateTime.now()),
        ),
      );

      final txId = await transactionRepo.insert(
        TransactionEntity(
          accountId: accountId,
          categoryId: 0,
          date: '10 Nov 2025',
          time: '05:19',
          amount: 10000,
          name: 'Bookmark test',
          category: '',
          remark: '',
          paymentMode: 'Cash',
          lastEditedDate: '10 Nov 2025',
          lastEditedTime: '05:19',
          imageUris: '[]',
          type: 'expense',
          isHeader: 0,
        ),
      );

      await transactionRepo.toggleBookmark(txId, true);
      final tx = await transactionRepo.getById(txId);
      expect(tx!.isBookmarked, 1);
    });
  });

  group('AccountRepository', () {
    test('calculates account balance', () async {
      final accountId = await accountRepo.insert(
        AccountEntity(
          entryName: 'Balance Test',
          dateTime: CashBookDateUtils.formatDateTime(DateTime.now()),
        ),
      );

      await transactionRepo.insert(
        TransactionEntity(
          accountId: accountId,
          categoryId: 0,
          date: '10 Nov 2025',
          time: '05:19',
          amount: 100000,
          name: 'Income',
          category: '',
          remark: '',
          paymentMode: 'Cash',
          lastEditedDate: '10 Nov 2025',
          lastEditedTime: '05:19',
          imageUris: '[]',
          type: 'income',
          isHeader: 0,
        ),
      );

      await transactionRepo.insert(
        TransactionEntity(
          accountId: accountId,
          categoryId: 0,
          date: '10 Nov 2025',
          time: '06:00',
          amount: 30000,
          name: 'Expense',
          category: '',
          remark: '',
          paymentMode: 'Cash',
          lastEditedDate: '10 Nov 2025',
          lastEditedTime: '06:00',
          imageUris: '[]',
          type: 'expense',
          isHeader: 0,
        ),
      );

      final balance = await accountRepo.getBalances();
      expect(balance[accountId], 70000);
    });
  });

  group('AppDatabase schema', () {
    test('creates all CashBook tables', () async {
      final tables = await database
          .customSelect(
            "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name",
          )
          .get();

      final tableNames = tables.map((r) => r.read<String>('name')).toSet();

      expect(tableNames, contains('income_table'));
      expect(tableNames, contains('account_entries'));
      expect(tableNames, contains('category_table'));
      expect(tableNames, contains('pay_mode_table'));
      expect(tableNames, contains('category'));
      expect(tableNames, contains('sub_categories'));
      expect(tableNames, contains('reminders'));
      expect(tableNames, contains('currency_denominations'));
      expect(tableNames, contains('room_master_table'));
    });
  });
}
