import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/amount_formatter.dart';
import '../../../core/utils/date_utils.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../providers/app_providers.dart';
import '../../providers/data_providers.dart';

/// Screen for adding or editing a transaction.
class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({
    super.key,
    required this.initialType,
    this.transaction,
  });

  final String initialType;
  final TransactionEntity? transaction;

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _type;
  late TextEditingController _amountController;
  late TextEditingController _nameController;
  late TextEditingController _remarkController;
  late TextEditingController _fromAccountController;
  late TextEditingController _toAccountController;
  int? _selectedAccountId;
  String? _selectedCategory;
  String? _selectedPaymentMode;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  final List<String> _imagePaths = [];
  bool _isBookmarked = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _type = widget.transaction?.type ?? widget.initialType;
    final tx = widget.transaction;
    _amountController = TextEditingController(
      text: tx != null
          ? AmountFormatter.toDisplayAmount(tx.amount).toString()
          : '',
    );
    _nameController = TextEditingController(text: tx?.name ?? '');
    _remarkController = TextEditingController(text: tx?.remark ?? '');
    _fromAccountController = TextEditingController(text: tx?.fromAccount ?? '');
    _toAccountController = TextEditingController(text: tx?.toAccount ?? '');
    _selectedAccountId = tx?.accountId;
    _selectedCategory = tx?.category.isNotEmpty == true ? tx!.category : null;
    _selectedPaymentMode = tx?.paymentMode.isNotEmpty == true
        ? tx!.paymentMode
        : null;
    _isBookmarked = tx?.isBookmark ?? false;

    if (tx != null) {
      final parsed = CashBookDateUtils.parseDate(tx.date);
      if (parsed != null) _selectedDate = parsed;
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    _remarkController.dispose();
    _fromAccountController.dispose();
    _toAccountController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _imagePaths.add(image.path));
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedAccountId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select an account')));
      return;
    }

    setState(() => _isSaving = true);

    try {
      final now = DateTime.now();
      final entity = TransactionEntity(
        id: widget.transaction?.id,
        accountId: _selectedAccountId!,
        categoryId: 0,
        date: CashBookDateUtils.formatDate(_selectedDate),
        time: CashBookDateUtils.formatTime(
          DateTime(
            _selectedDate.year,
            _selectedDate.month,
            _selectedDate.day,
            _selectedTime.hour,
            _selectedTime.minute,
          ),
        ),
        amount: AmountFormatter.toStorageAmount(
          double.parse(_amountController.text),
        ),
        name: _nameController.text,
        category: _selectedCategory ?? '',
        remark: _remarkController.text,
        paymentMode: _selectedPaymentMode ?? '',
        lastEditedDate: CashBookDateUtils.formatDate(now),
        lastEditedTime: CashBookDateUtils.formatTime(now),
        imageUris: jsonEncode(_imagePaths),
        type: _type,
        isHeader: 0,
        isBookmarked: _isBookmarked ? 1 : 0,
        fromAccount: _type == 'transfer' ? _fromAccountController.text : null,
        toAccount: _type == 'transfer' ? _toAccountController.text : null,
        transferType: _type == 'transfer' ? 'transfer' : null,
      );

      final repo = ref.read(transactionRepositoryProvider);
      if (widget.transaction?.id != null) {
        await repo.update(entity);
      } else {
        await repo.insert(entity);
      }

      refreshDatabase(ref);
      if (mounted) context.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final accountsAsync = ref.watch(accountsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    final payModesAsync = ref.watch(paymentModesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.transaction == null ? 'Add Transaction' : 'Edit Transaction',
        ),
        actions: [
          TextButton(
            onPressed: _isSaving ? null : _save,
            child: _isSaving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'expense', label: Text('Expense')),
                ButtonSegment(value: 'income', label: Text('Income')),
                ButtonSegment(value: 'transfer', label: Text('Transfer')),
              ],
              selected: {_type},
              onSelectionChanged: (s) => setState(() => _type = s.first),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: '₹ ',
              ),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Required';
                if (double.tryParse(v) == null) return 'Invalid amount';
                return null;
              },
            ),
            const SizedBox(height: 16),
            accountsAsync.when(
              data: (accounts) => DropdownButtonFormField<int>(
                initialValue: _selectedAccountId,
                decoration: const InputDecoration(labelText: 'Account'),
                items: accounts
                    .map(
                      (a) => DropdownMenuItem(
                        value: a.id,
                        child: Text(a.entryName),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _selectedAccountId = v),
              ),
              loading: () => const LinearProgressIndicator(),
              error: (_, _) => const Text('Failed to load accounts'),
            ),
            const SizedBox(height: 16),
            categoriesAsync.when(
              data: (categories) => DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                decoration: const InputDecoration(labelText: 'Category'),
                items: categories
                    .map(
                      (c) => DropdownMenuItem(
                        value: c.categoryName,
                        child: Text(c.categoryName),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _selectedCategory = v),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            payModesAsync.when(
              data: (modes) => DropdownButtonFormField<String>(
                initialValue: _selectedPaymentMode,
                decoration: const InputDecoration(labelText: 'Payment Mode'),
                items: modes
                    .map(
                      (m) => DropdownMenuItem(
                        value: m.payModeName,
                        child: Text(m.payModeName),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _selectedPaymentMode = v),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name / Title'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _remarkController,
              decoration: const InputDecoration(labelText: 'Remark'),
              maxLines: 2,
            ),
            if (_type == 'transfer') ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: _fromAccountController,
                decoration: const InputDecoration(labelText: 'From Account'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _toAccountController,
                decoration: const InputDecoration(labelText: 'To Account'),
              ),
            ],
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Date'),
              subtitle: Text(CashBookDateUtils.formatDate(_selectedDate)),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) setState(() => _selectedDate = date);
              },
            ),
            ListTile(
              title: const Text('Time'),
              subtitle: Text(_selectedTime.format(context)),
              trailing: const Icon(Icons.access_time),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime,
                );
                if (time != null) setState(() => _selectedTime = time);
              },
            ),
            SwitchListTile(
              title: const Text('Bookmark'),
              value: _isBookmarked,
              onChanged: (v) => setState(() => _isBookmarked = v),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final path in _imagePaths)
                  Chip(
                    label: Text(path.split('/').last),
                    onDeleted: () => setState(() => _imagePaths.remove(path)),
                  ),
                ActionChip(
                  avatar: const Icon(Icons.add_a_photo, size: 18),
                  label: const Text('Add Image'),
                  onPressed: _pickImage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
