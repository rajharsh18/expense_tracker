# CashBook Expense Tracker

A production-ready Flutter expense tracker application fully compatible with **CashBook backup ZIP files**. Import existing CashBook backups and export new ones without any data conversion or schema changes.

## Features

- **CashBook Backup Compatibility** — Import/export `CashBook_Backup_YYYYMMDD_HHMMSS.zip` files with `cashbook_db.db`, `notebook_db.db`, and `metadata.json`
- **Transactions** — Income, Expense, and Transfer with amount, account, category, date, time, payment mode, remark, images, bookmarks, and edit history
- **Accounts** — Unlimited accounts (Cash, Bank, Wallet, Credit Card, UPI, Savings, Business)
- **Categories** — Add, edit, delete categories with icons and colors
- **Reports** — Weekly, monthly, yearly analytics with income vs expense, category breakdown, payment mode, and account-wise reports
- **Dashboard** — Balance, today's summary, monthly overview, charts, recent transactions, reminders, budget progress
- **Search** — Global search with advanced filters
- **Settings** — Dark mode, currency, backup/restore, language, budget reminders

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.44+ |
| UI | Material 3 |
| State | Riverpod |
| Database | Drift (SQLite) |
| Navigation | go_router |
| Models | Freezed + json_serializable |
| Charts | fl_chart |
| Architecture | Clean Architecture + Repository Pattern |

## Database Schema

Uses the exact CashBook schema from `cashbook_db.db`:

- `income_table` — All transactions (income/expense/transfer)
- `account_entries` — Accounts/ledgers
- `category_table` — Category names
- `pay_mode_table` — Payment modes
- `category` / `sub_categories` — Filter categories
- `reminders` — Scheduled reminders
- `currency_denominations` — Currency settings
- `room_master_table` / `android_metadata` — Schema compatibility

## Getting Started

### Prerequisites

- Flutter SDK 3.44+
- Android SDK (for APK builds)

### Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

### Build APK

```bash
flutter build apk --release
```

## Backup Import/Export

### Export

1. Open **Settings** → **Export Backup**
2. A `CashBook_Backup_YYYYMMDD_HHMMSS.zip` file is created
3. Share or save the file

### Import

1. Open **Settings** → **Import Backup** (replace) or **Merge Backup** (merge)
2. Select a CashBook ZIP file from your device
3. Data is restored with full schema compatibility

### ZIP Structure

```
CashBook_Backup_20260714_052946.zip
├── cashbook_db.db
├── notebook_db.db
├── notebook_db-wal (optional)
├── notebook_db-shm (optional)
└── metadata.json
```

### metadata.json

```json
{
  "app_name": "CashBook",
  "backup_date": "2026-07-14 05:29:46",
  "version": 1,
  "attachment_count": 0
}
```

## Project Structure

```
lib/
├── core/           # Constants, theme, router, utils
├── data/           # Database, repositories, services, models
├── domain/         # Entities
├── presentation/   # Providers, screens, widgets
├── app.dart
└── main.dart
test/
├── repositories/
├── services/
└── widget_test.dart
```

## Testing

```bash
flutter test
```

## Sample Data

Place CashBook database files in `sample_db/` for first-launch seeding:

- `cashbook_db.db`
- `notebook_db.db`
- `metadata.json`

## License

Private project — not for publication.
