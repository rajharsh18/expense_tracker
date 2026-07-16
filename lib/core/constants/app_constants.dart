/// Application-wide constants for CashBook-compatible expense tracker.
class AppConstants {
  AppConstants._();

  static const String appName = 'CashBook';
  static const String cashbookDbName = 'cashbook_db.db';
  static const String notebookDbName = 'notebook_db.db';
  static const String notebookWalName = 'notebook_db-wal';
  static const String notebookShmName = 'notebook_db-shm';
  static const String metadataFileName = 'metadata.json';
  static const String backupPrefix = 'CashBook_Backup_';
  static const int backupVersion = 1;
  /// CashBook Room database schema version (PRAGMA user_version).
  static const int cashbookSchemaVersion = 3;
  static const String defaultCurrency = 'INR';
  static const String defaultCurrencySymbol = '₹';
  static const String defaultLocale = 'en_IN';

  static const List<String> requiredBackupFiles = [
    cashbookDbName,
    notebookDbName,
    metadataFileName,
  ];

  static const List<String> accountTypes = [
    'Cash',
    'Bank',
    'Wallet',
    'Credit Card',
    'UPI',
    'Savings',
    'Business',
  ];

  static const List<String> transactionTypes = [
    'income',
    'expense',
    'transfer',
    'grain',
    'grain_in',
    'grain_out',
  ];

  static const String roomIdentityHash =
      'c0a617c0bad5975bcc0201767eba7873';
}
