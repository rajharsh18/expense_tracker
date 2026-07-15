import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_metadata.freezed.dart';

/// Metadata structure inside CashBook backup ZIP files.
@Freezed(fromJson: false, toJson: false)
abstract class BackupMetadata with _$BackupMetadata {
  const BackupMetadata._();

  const factory BackupMetadata({
    required String appName,
    required String backupDate,
    required int version,
    required int attachmentCount,
  }) = _BackupMetadata;

  factory BackupMetadata.fromJson(Map<String, dynamic> json) {
    return BackupMetadata(
      appName: json['app_name'] as String,
      backupDate: json['backup_date'] as String,
      version: (json['version'] as num).toInt(),
      attachmentCount: (json['attachment_count'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
    'app_name': appName,
    'backup_date': backupDate,
    'version': version,
    'attachment_count': attachmentCount,
  };

  factory BackupMetadata.create({int attachmentCount = 0}) {
    final now = DateTime.now();
    final formatted =
        '${now.year.toString().padLeft(4, '0')}-'
        '${now.month.toString().padLeft(2, '0')}-'
        '${now.day.toString().padLeft(2, '0')} '
        '${now.hour.toString().padLeft(2, '0')}:'
        '${now.minute.toString().padLeft(2, '0')}:'
        '${now.second.toString().padLeft(2, '0')}';
    return BackupMetadata(
      appName: 'CashBook',
      backupDate: formatted,
      version: 1,
      attachmentCount: attachmentCount,
    );
  }
}

enum BackupImportMode { replace, merge }

enum BackupProgressStage {
  validating,
  extracting,
  importing,
  merging,
  complete,
  error,
}

@freezed
abstract class BackupProgress with _$BackupProgress {
  const factory BackupProgress({
    required BackupProgressStage stage,
    required double progress,
    String? message,
  }) = _BackupProgress;
}

@freezed
abstract class BackupResult with _$BackupResult {
  const factory BackupResult.success({
    required String filePath,
    required int transactionCount,
    required int accountCount,
  }) = BackupSuccess;

  const factory BackupResult.failure({required String message}) = BackupFailure;
}
