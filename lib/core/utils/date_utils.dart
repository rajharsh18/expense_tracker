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
    try {
      return _dateFormat.parse(date);
    } catch (_) {
      return null;
    }
  }

  static DateTime? parseDateTime(String dateTime) {
    try {
      return _dateTimeFormat.parse(dateTime);
    } catch (_) {
      return parseDate(dateTime);
    }
  }

  static DateTime? parseTimeOnDate(String time, DateTime date) {
    try {
      final parsed = _time12Format.parse(time);
      return DateTime(
        date.year,
        date.month,
        date.day,
        parsed.hour,
        parsed.minute,
      );
    } catch (_) {
      try {
        final parsed = _time24Format.parse(time);
        return DateTime(
          date.year,
          date.month,
          date.day,
          parsed.hour,
          parsed.minute,
        );
      } catch (_) {
        return null;
      }
    }
  }

  static DateTime startOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static DateTime endOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

  static DateTime startOfWeek(DateTime date) {
    final weekday = date.weekday;
    return startOfDay(date.subtract(Duration(days: weekday - 1)));
  }

  static DateTime endOfWeek(DateTime date) {
    final weekday = date.weekday;
    return endOfDay(date.add(Duration(days: 7 - weekday)));
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
