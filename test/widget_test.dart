import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:expense_tracker/core/services/settings_service.dart';
import 'package:expense_tracker/domain/entities/transaction_entity.dart';
import 'package:expense_tracker/presentation/widgets/transaction_tile.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('TransactionTile displays expense amount', (tester) async {
    const transaction = TransactionEntity(
      accountId: 1,
      categoryId: 0,
      date: '10 Nov 2025',
      time: '05:19',
      amount: 300000,
      name: 'Groceries',
      category: 'Food',
      remark: '',
      paymentMode: 'Cash',
      lastEditedDate: '10 Nov 2025',
      lastEditedTime: '05:19',
      imageUris: '[]',
      type: 'expense',
      isHeader: 0,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TransactionTile(
            transaction: transaction,
            accountName: 'Cashbook',
          ),
        ),
      ),
    );

    expect(find.text('Groceries'), findsOneWidget);
    expect(find.textContaining('Cashbook'), findsOneWidget);
  });

  test('SettingsService persists dark mode', () async {
    final prefs = await SharedPreferences.getInstance();
    final settings = SettingsService(prefs);

    expect(settings.isDarkMode, false);
    await settings.setDarkMode(true);
    expect(settings.isDarkMode, true);
  });
}
