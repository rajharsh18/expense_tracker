import 'package:intl/intl.dart';

/// Date/time parsing utilities for CashBook text date formats.
class CashBookDateUtils {
  CashBookDateUtils._();

  static final DateFormat _dateFormat = DateFormat('dd MMM yyyy');
  static final DateFormat _dateTimeFormat = DateFormat('dd MMM yyyy hh:mm a');
  static final DateFormat _time12Format = DateFormat('hh:mm a');
  static final DateFormat _time24Format = DateFormat('HH:mm');
  static final DateFormat _backupFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  static final DateFormat _backupFileFormat = DateFormat('yyyyMMdd_HHmmss');

  static String formatDate(DateTime date) => _dateFormat.format(date);

  static String formatDateTime(DateTime date) => _dateTimeFormat.format(date);

  static String formatTime(DateTime date) {
    final hour = date.hour;
    if (hour == 0 || hour < 12 && date.minute == 0) {
      return _time24Format.format(date);
    }
    return _time12Format.format(date);
  }

  static String formatBackupDate(DateTime date) => _backupFormat.format(date);

  static String formatBackupFileName(DateTime date) =>
      _backupFileFormat.format(date);

  static DateTime? parseDate(String date) {
    final trimmed = date.trim();
    if (trimmed.isEmpty) return null;

    try {
      return _dateFormat.parse(trimmed);
    } catch (_) {}

    try {
      return DateFormat('yyyy-MM-dd').parse(trimmed);
    } catch (_) {}

    return DateTime.tryParse(trimmed);
  }

  static DateTime? parseDateTime(String dateTime) {
    try {
      return _dateTimeFormat.parse(dateTime);
    } catch (_) {
      return parseDate(dateTime);
    }
  }

  static DateTime? parseTimeOnDate(String time, DateTime date) {
    final trimmed = time.trim();
    if (trimmed.isEmpty) {
      return startOfDay(date);
    }

    final formats = <DateFormat>[
      _time12Format,
      DateFormat('h:mm a'),
      _time24Format,
      DateFormat('HH:mm:ss'),
    ];

    for (final format in formats) {
      try {
        final parsed = format.parse(trimmed);
        return DateTime(
          date.year,
          date.month,
          date.day,
          parsed.hour,
          parsed.minute,
          parsed.second,
        );
      } catch (_) {}
    }

    return null;
  }

  /// Combines a CashBook transaction date and time for sorting.
  static DateTime? transactionDateTime(String date, String time) {
    final parsedDate = parseDate(date);
    if (parsedDate == null) return null;
    return parseTimeOnDate(time, parsedDate) ?? startOfDay(parsedDate);
  }

  /// Newest first. Returns 0 when both values are equal or unparseable.
  static int compareTransactionDateTimeDesc({
    required String dateA,
    required String timeA,
    required String dateB,
    required String timeB,
  }) {
    final aDateTime = transactionDateTime(dateA, timeA);
    final bDateTime = transactionDateTime(dateB, timeB);

    if (aDateTime != null && bDateTime != null) {
      return bDateTime.compareTo(aDateTime);
    }
    if (aDateTime != null) return -1;
    if (bDateTime != null) return 1;
    return 0;
  }

  static DateTime startOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static DateTime endOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

  /// Week runs Sunday through Saturday.
  static DateTime startOfWeek(DateTime date) {
    final daysFromSunday = date.weekday % 7;
    return startOfDay(date.subtract(Duration(days: daysFromSunday)));
  }

  /// Week runs Sunday through Saturday.
  static DateTime endOfWeek(DateTime date) {
    return endOfDay(startOfWeek(date).add(const Duration(days: 6)));
  }

  static DateTime startOfMonth(DateTime date) =>
      DateTime(date.year, date.month, 1);

  static DateTime endOfMonth(DateTime date) =>
      DateTime(date.year, date.month + 1, 0, 23, 59, 59, 999);

  static DateTime startOfYear(DateTime date) => DateTime(date.year, 1, 1);

  static DateTime endOfYear(DateTime date) =>
      DateTime(date.year, 12, 31, 23, 59, 59, 999);

  static bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static bool isInRange(DateTime date, DateTime start, DateTime end) =>
      !date.isBefore(start) && !date.isAfter(end);
}
