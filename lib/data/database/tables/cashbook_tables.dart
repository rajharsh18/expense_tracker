import 'package:drift/drift.dart';

/// CashBook category_table - expense/income category names.
class CategoryTable extends Table {
  @override
  String get tableName => 'category_table';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get categoryName => text().named('category_name')();
}

/// CashBook pay_mode_table - payment modes.
class PayModeTable extends Table {
  @override
  String get tableName => 'pay_mode_table';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get payModeName => text().named('pay_mode_name')();
}

/// CashBook currency_denominations table.
class CurrencyDenominations extends Table {
  @override
  String get tableName => 'currency_denominations';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get countryCode => text().named('countryCode')();
  RealColumn get denominationValue => real().named('denominationValue')();
  IntColumn get isEnabled => integer().named('isEnabled')();
}

/// CashBook category - filter/report categories.
class Category extends Table {
  @override
  String get tableName => 'category';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

/// CashBook sub_categories - nested filter categories.
class SubCategories extends Table {
  @override
  String get tableName => 'sub_categories';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get mainCategoryId => integer().named('mainCategoryId')();
  TextColumn get name => text()();
  IntColumn get position => integer()();
}

/// CashBook account_entries - user accounts/ledgers.
class AccountEntries extends Table {
  @override
  String get tableName => 'account_entries';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get entryName => text().named('entryName')();
  TextColumn get entryDateTime => text().named('dateTime')();
}

/// CashBook reminders table.
class Reminders extends Table {
  @override
  String get tableName => 'reminders';

  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get frequency => text()();
  TextColumn get date => text()();
  TextColumn get time => text()();
  TextColumn get note => text()();
  IntColumn get isActive => integer().named('isActive')();

  @override
  Set<Column> get primaryKey => {id};
}

/// CashBook income_table - all transactions (income, expense, transfer).
class IncomeTable extends Table {
  @override
  String get tableName => 'income_table';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountId => integer().named('accountId')();
  IntColumn get categoryId => integer().named('categoryId')();
  TextColumn get date => text()();
  TextColumn get time => text()();
  IntColumn get amount => integer()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get remark => text()();
  TextColumn get paymentMode => text().named('paymentMode')();
  TextColumn get lastEditedDate => text().named('lastEditedDate')();
  TextColumn get lastEditedTime => text().named('lastEditedTime')();
  TextColumn get imageUris => text().named('imageUris')();
  TextColumn get type => text()();
  IntColumn get isHeader => integer().named('isHeader')();
  IntColumn get isBookmarked =>
      integer().named('isBookmarked').withDefault(const Constant(0))();
  TextColumn get fromAccount => text().named('fromAccount').nullable()();
  TextColumn get toAccount => text().named('toAccount').nullable()();
  TextColumn get transferType => text().named('transferType').nullable()();
}

/// Room persistence metadata table for schema compatibility.
class RoomMasterTable extends Table {
  @override
  String get tableName => 'room_master_table';

  IntColumn get id => integer()();
  TextColumn get identityHash => text().named('identity_hash')();

  @override
  Set<Column> get primaryKey => {id};
}

/// Android metadata table for locale compatibility.
class AndroidMetadata extends Table {
  @override
  String get tableName => 'android_metadata';

  TextColumn get locale => text()();
}
