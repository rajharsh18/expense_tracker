import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/navigation/back_navigation.dart';
import '../../../core/utils/amount_formatter.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/weight_formatter.dart';
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
  int? _selectedAccountId;
  String? _selectedCategory;
  String? _selectedPaymentMode;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _isBookmarked = false;
  bool _isGrainMode = false;
  String _grainDirection = 'in';
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final tx = widget.transaction;
    _isGrainMode = tx?.isGrain ?? false;
    var resolvedType = tx?.type ?? widget.initialType;
    if (resolvedType == 'transfer') resolvedType = 'expense';
    _type = resolvedType;
    if (_isGrainMode) {
      _grainDirection = tx?.isGrainOut == true ? 'out' : 'in';
      _type = _grainDirection == 'out' ? 'grain_out' : 'grain_in';
    }

    _amountController = TextEditingController(
      text: tx != null
          ? _isGrainMode
              ? WeightFormatter.toDisplayKg(tx.amount).toString()
              : AmountFormatter.toDisplayAmount(tx.amount).toString()
          : '',
    );
    _nameController = TextEditingController(text: tx?.name ?? '');
    _remarkController = TextEditingController(text: tx?.remark ?? '');
    _selectedAccountId = tx?.accountId;
    _selectedCategory = tx?.category.isNotEmpty == true ? tx!.category : null;
    _selectedPaymentMode = tx?.paymentMode.isNotEmpty == true
        ? tx!.paymentMode
        : null;
    _isBookmarked = tx?.isBookmark ?? false;

    if (tx != null) {
      final parsed = CashBookDateUtils.parseDate(tx.date);
      if (parsed != null) {
        _selectedDate = parsed;
        final parsedTime = CashBookDateUtils.parseTimeOnDate(tx.time, parsed);
        if (parsedTime != null) {
          _selectedTime = TimeOfDay(
            hour: parsedTime.hour,
            minute: parsedTime.minute,
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    _remarkController.dispose();
    super.dispose();
  }

  void _onGrainModeChanged(bool value) {
    setState(() {
      _isGrainMode = value;
      if (value) {
        _grainDirection = 'in';
        _type = 'grain_in';
      } else if (_type.startsWith('grain')) {
        _type = 'expense';
      }
      _amountController.clear();
    });
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
      final parsedValue = double.parse(_amountController.text);
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
        amount: _isGrainMode
            ? WeightFormatter.toStorageGrams(parsedValue)
            : AmountFormatter.toStorageAmount(parsedValue),
        name: _nameController.text,
        category: _selectedCategory ?? '',
        remark: _remarkController.text,
        paymentMode: _selectedPaymentMode ?? '',
        lastEditedDate: CashBookDateUtils.formatDate(now),
        lastEditedTime: CashBookDateUtils.formatTime(now),
        imageUris: '[]',
        type: _isGrainMode
            ? (_grainDirection == 'out' ? 'grain_out' : 'grain_in')
            : _type,
        isHeader: 0,
        isBookmarked: _isBookmarked ? 1 : 0,
      );

      final repo = ref.read(transactionRepositoryProvider);
      if (widget.transaction?.id != null) {
        await repo.update(entity);
      } else {
        await repo.insert(entity);
      }

      refreshDatabase(ref);
      if (mounted) navigateToHome(context);
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
    final currencySymbol = ref.watch(currencySymbolProvider);

    return Scaffold(
      appBar: AppPageAppBar(
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
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  SwitchListTile(
                    title: const Text('Record in kg (Grains)'),
                    subtitle: const Text(
                      'Track weight in kilograms instead of amount',
                    ),
                    value: _isGrainMode,
                    onChanged: _onGrainModeChanged,
                    contentPadding: EdgeInsets.zero,
                  ),
                  if (_isGrainMode) ...[
                    const SizedBox(height: 8),
                    SegmentedButton<String>(
                      segments: const [
                        ButtonSegment(value: 'in', label: Text('IN')),
                        ButtonSegment(value: 'out', label: Text('OUT')),
                      ],
                      selected: {_grainDirection},
                      onSelectionChanged: (s) => setState(() {
                        _grainDirection = s.first;
                        _type = _grainDirection == 'out'
                            ? 'grain_out'
                            : 'grain_in';
                      }),
                    ),
                  ] else ...[
                    const SizedBox(height: 8),
                    SegmentedButton<String>(
                      segments: const [
                        ButtonSegment(value: 'expense', label: Text('Expense')),
                        ButtonSegment(value: 'income', label: Text('Income')),
                      ],
                      selected: {_type},
                      onSelectionChanged: (s) =>
                          setState(() => _type = s.first),
                    ),
                  ],
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _amountController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      label: _RequiredLabel(
                        text: _isGrainMode ? 'Weight (kg)' : 'Amount',
                      ),
                      prefixText: _isGrainMode ? null : '$currencySymbol ',
                      suffixText: _isGrainMode ? 'kg' : null,
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Required';
                      final parsed = double.tryParse(v);
                      if (parsed == null) {
                        return _isGrainMode ? 'Invalid weight' : 'Invalid amount';
                      }
                      if (_isGrainMode && parsed <= 0) {
                        return 'Weight must be greater than 0';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  accountsAsync.when(
                    data: (accounts) => DropdownButtonFormField<int>(
                      initialValue: _selectedAccountId,
                      decoration: const InputDecoration(
                        label: _RequiredLabel(text: 'Account'),
                      ),
                      items: accounts
                          .map(
                            (a) => DropdownMenuItem(
                              value: a.id,
                              child: Text(a.entryName),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => _selectedAccountId = v),
                      validator: (v) => v == null ? 'Required' : null,
                    ),
                    loading: () => const LinearProgressIndicator(),
                    error: (_, _) => const Text('Failed to load accounts'),
                  ),
                  if (!_isGrainMode) ...[
                    const SizedBox(height: 16),
                    ref.watch(categoriesProvider).when(
                      data: (categories) => DropdownButtonFormField<String>(
                        initialValue: _selectedCategory,
                        decoration:
                            const InputDecoration(labelText: 'Category'),
                        items: categories
                            .map(
                              (c) => DropdownMenuItem(
                                value: c.categoryName,
                                child: Text(c.categoryName),
                              ),
                            )
                            .toList(),
                        onChanged: (v) =>
                            setState(() => _selectedCategory = v),
                      ),
                      loading: () => const SizedBox.shrink(),
                      error: (_, _) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 16),
                    ref.watch(paymentModesProvider).when(
                      data: (modes) => DropdownButtonFormField<String>(
                        initialValue: _selectedPaymentMode,
                        decoration: const InputDecoration(
                          labelText: 'Payment Mode',
                        ),
                        items: modes
                            .map(
                              (m) => DropdownMenuItem(
                                value: m.payModeName,
                                child: Text(m.payModeName),
                              ),
                            )
                            .toList(),
                        onChanged: (v) =>
                            setState(() => _selectedPaymentMode = v),
                      ),
                      loading: () => const SizedBox.shrink(),
                      error: (_, _) => const SizedBox.shrink(),
                    ),
                  ],
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
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _isSaving ? null : _save,
                  child: _isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Done'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RequiredLabel extends StatelessWidget {
  const _RequiredLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
