// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackupMetadata {

 String get appName; String get backupDate; int get version; int get attachmentCount;
/// Create a copy of BackupMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupMetadataCopyWith<BackupMetadata> get copyWith => _$BackupMetadataCopyWithImpl<BackupMetadata>(this as BackupMetadata, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupMetadata&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.backupDate, backupDate) || other.backupDate == backupDate)&&(identical(other.version, version) || other.version == version)&&(identical(other.attachmentCount, attachmentCount) || other.attachmentCount == attachmentCount));
}


@override
int get hashCode => Object.hash(runtimeType,appName,backupDate,version,attachmentCount);

@override
String toString() {
  return 'BackupMetadata(appName: $appName, backupDate: $backupDate, version: $version, attachmentCount: $attachmentCount)';
}


}

/// @nodoc
abstract mixin class $BackupMetadataCopyWith<$Res>  {
  factory $BackupMetadataCopyWith(BackupMetadata value, $Res Function(BackupMetadata) _then) = _$BackupMetadataCopyWithImpl;
@useResult
$Res call({
 String appName, String backupDate, int version, int attachmentCount
});




}
/// @nodoc
class _$BackupMetadataCopyWithImpl<$Res>
    implements $BackupMetadataCopyWith<$Res> {
  _$BackupMetadataCopyWithImpl(this._self, this._then);

  final BackupMetadata _self;
  final $Res Function(BackupMetadata) _then;

/// Create a copy of BackupMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appName = null,Object? backupDate = null,Object? version = null,Object? attachmentCount = null,}) {
  return _then(_self.copyWith(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,backupDate: null == backupDate ? _self.backupDate : backupDate // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,attachmentCount: null == attachmentCount ? _self.attachmentCount : attachmentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BackupMetadata].
extension BackupMetadataPatterns on BackupMetadata {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackupMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupMetadata() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackupMetadata value)  $default,){
final _that = this;
switch (_that) {
case _BackupMetadata():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackupMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _BackupMetadata() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String appName,  String backupDate,  int version,  int attachmentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupMetadata() when $default != null:
return $default(_that.appName,_that.backupDate,_that.version,_that.attachmentCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String appName,  String backupDate,  int version,  int attachmentCount)  $default,) {final _that = this;
switch (_that) {
case _BackupMetadata():
return $default(_that.appName,_that.backupDate,_that.version,_that.attachmentCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String appName,  String backupDate,  int version,  int attachmentCount)?  $default,) {final _that = this;
switch (_that) {
case _BackupMetadata() when $default != null:
return $default(_that.appName,_that.backupDate,_that.version,_that.attachmentCount);case _:
  return null;

}
}

}

/// @nodoc


class _BackupMetadata extends BackupMetadata {
  const _BackupMetadata({required this.appName, required this.backupDate, required this.version, required this.attachmentCount}): super._();
  

@override final  String appName;
@override final  String backupDate;
@override final  int version;
@override final  int attachmentCount;

/// Create a copy of BackupMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupMetadataCopyWith<_BackupMetadata> get copyWith => __$BackupMetadataCopyWithImpl<_BackupMetadata>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupMetadata&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.backupDate, backupDate) || other.backupDate == backupDate)&&(identical(other.version, version) || other.version == version)&&(identical(other.attachmentCount, attachmentCount) || other.attachmentCount == attachmentCount));
}


@override
int get hashCode => Object.hash(runtimeType,appName,backupDate,version,attachmentCount);

@override
String toString() {
  return 'BackupMetadata(appName: $appName, backupDate: $backupDate, version: $version, attachmentCount: $attachmentCount)';
}


}

/// @nodoc
abstract mixin class _$BackupMetadataCopyWith<$Res> implements $BackupMetadataCopyWith<$Res> {
  factory _$BackupMetadataCopyWith(_BackupMetadata value, $Res Function(_BackupMetadata) _then) = __$BackupMetadataCopyWithImpl;
@override @useResult
$Res call({
 String appName, String backupDate, int version, int attachmentCount
});




}
/// @nodoc
class __$BackupMetadataCopyWithImpl<$Res>
    implements _$BackupMetadataCopyWith<$Res> {
  __$BackupMetadataCopyWithImpl(this._self, this._then);

  final _BackupMetadata _self;
  final $Res Function(_BackupMetadata) _then;

/// Create a copy of BackupMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appName = null,Object? backupDate = null,Object? version = null,Object? attachmentCount = null,}) {
  return _then(_BackupMetadata(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,backupDate: null == backupDate ? _self.backupDate : backupDate // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,attachmentCount: null == attachmentCount ? _self.attachmentCount : attachmentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$BackupProgress {

 BackupProgressStage get stage; double get progress; String? get message;
/// Create a copy of BackupProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupProgressCopyWith<BackupProgress> get copyWith => _$BackupProgressCopyWithImpl<BackupProgress>(this as BackupProgress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupProgress&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,stage,progress,message);

@override
String toString() {
  return 'BackupProgress(stage: $stage, progress: $progress, message: $message)';
}


}

/// @nodoc
abstract mixin class $BackupProgressCopyWith<$Res>  {
  factory $BackupProgressCopyWith(BackupProgress value, $Res Function(BackupProgress) _then) = _$BackupProgressCopyWithImpl;
@useResult
$Res call({
 BackupProgressStage stage, double progress, String? message
});




}
/// @nodoc
class _$BackupProgressCopyWithImpl<$Res>
    implements $BackupProgressCopyWith<$Res> {
  _$BackupProgressCopyWithImpl(this._self, this._then);

  final BackupProgress _self;
  final $Res Function(BackupProgress) _then;

/// Create a copy of BackupProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stage = null,Object? progress = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as BackupProgressStage,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BackupProgress].
extension BackupProgressPatterns on BackupProgress {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackupProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupProgress() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackupProgress value)  $default,){
final _that = this;
switch (_that) {
case _BackupProgress():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackupProgress value)?  $default,){
final _that = this;
switch (_that) {
case _BackupProgress() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BackupProgressStage stage,  double progress,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupProgress() when $default != null:
return $default(_that.stage,_that.progress,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BackupProgressStage stage,  double progress,  String? message)  $default,) {final _that = this;
switch (_that) {
case _BackupProgress():
return $default(_that.stage,_that.progress,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BackupProgressStage stage,  double progress,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _BackupProgress() when $default != null:
return $default(_that.stage,_that.progress,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _BackupProgress implements BackupProgress {
  const _BackupProgress({required this.stage, required this.progress, this.message});
  

@override final  BackupProgressStage stage;
@override final  double progress;
@override final  String? message;

/// Create a copy of BackupProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupProgressCopyWith<_BackupProgress> get copyWith => __$BackupProgressCopyWithImpl<_BackupProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupProgress&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,stage,progress,message);

@override
String toString() {
  return 'BackupProgress(stage: $stage, progress: $progress, message: $message)';
}


}

/// @nodoc
abstract mixin class _$BackupProgressCopyWith<$Res> implements $BackupProgressCopyWith<$Res> {
  factory _$BackupProgressCopyWith(_BackupProgress value, $Res Function(_BackupProgress) _then) = __$BackupProgressCopyWithImpl;
@override @useResult
$Res call({
 BackupProgressStage stage, double progress, String? message
});




}
/// @nodoc
class __$BackupProgressCopyWithImpl<$Res>
    implements _$BackupProgressCopyWith<$Res> {
  __$BackupProgressCopyWithImpl(this._self, this._then);

  final _BackupProgress _self;
  final $Res Function(_BackupProgress) _then;

/// Create a copy of BackupProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stage = null,Object? progress = null,Object? message = freezed,}) {
  return _then(_BackupProgress(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as BackupProgressStage,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BackupResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupResult()';
}


}

/// @nodoc
class $BackupResultCopyWith<$Res>  {
$BackupResultCopyWith(BackupResult _, $Res Function(BackupResult) __);
}


/// Adds pattern-matching-related methods to [BackupResult].
extension BackupResultPatterns on BackupResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BackupSuccess value)?  success,TResult Function( BackupFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BackupSuccess() when success != null:
return success(_that);case BackupFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BackupSuccess value)  success,required TResult Function( BackupFailure value)  failure,}){
final _that = this;
switch (_that) {
case BackupSuccess():
return success(_that);case BackupFailure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BackupSuccess value)?  success,TResult? Function( BackupFailure value)?  failure,}){
final _that = this;
switch (_that) {
case BackupSuccess() when success != null:
return success(_that);case BackupFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String filePath,  int transactionCount,  int accountCount)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BackupSuccess() when success != null:
return success(_that.filePath,_that.transactionCount,_that.accountCount);case BackupFailure() when failure != null:
return failure(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String filePath,  int transactionCount,  int accountCount)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case BackupSuccess():
return success(_that.filePath,_that.transactionCount,_that.accountCount);case BackupFailure():
return failure(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String filePath,  int transactionCount,  int accountCount)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case BackupSuccess() when success != null:
return success(_that.filePath,_that.transactionCount,_that.accountCount);case BackupFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class BackupSuccess implements BackupResult {
  const BackupSuccess({required this.filePath, required this.transactionCount, required this.accountCount});
  

 final  String filePath;
 final  int transactionCount;
 final  int accountCount;

/// Create a copy of BackupResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupSuccessCopyWith<BackupSuccess> get copyWith => _$BackupSuccessCopyWithImpl<BackupSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupSuccess&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.transactionCount, transactionCount) || other.transactionCount == transactionCount)&&(identical(other.accountCount, accountCount) || other.accountCount == accountCount));
}


@override
int get hashCode => Object.hash(runtimeType,filePath,transactionCount,accountCount);

@override
String toString() {
  return 'BackupResult.success(filePath: $filePath, transactionCount: $transactionCount, accountCount: $accountCount)';
}


}

/// @nodoc
abstract mixin class $BackupSuccessCopyWith<$Res> implements $BackupResultCopyWith<$Res> {
  factory $BackupSuccessCopyWith(BackupSuccess value, $Res Function(BackupSuccess) _then) = _$BackupSuccessCopyWithImpl;
@useResult
$Res call({
 String filePath, int transactionCount, int accountCount
});




}
/// @nodoc
class _$BackupSuccessCopyWithImpl<$Res>
    implements $BackupSuccessCopyWith<$Res> {
  _$BackupSuccessCopyWithImpl(this._self, this._then);

  final BackupSuccess _self;
  final $Res Function(BackupSuccess) _then;

/// Create a copy of BackupResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filePath = null,Object? transactionCount = null,Object? accountCount = null,}) {
  return _then(BackupSuccess(
filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,transactionCount: null == transactionCount ? _self.transactionCount : transactionCount // ignore: cast_nullable_to_non_nullable
as int,accountCount: null == accountCount ? _self.accountCount : accountCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class BackupFailure implements BackupResult {
  const BackupFailure({required this.message});
  

 final  String message;

/// Create a copy of BackupResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupFailureCopyWith<BackupFailure> get copyWith => _$BackupFailureCopyWithImpl<BackupFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BackupResult.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $BackupFailureCopyWith<$Res> implements $BackupResultCopyWith<$Res> {
  factory $BackupFailureCopyWith(BackupFailure value, $Res Function(BackupFailure) _then) = _$BackupFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BackupFailureCopyWithImpl<$Res>
    implements $BackupFailureCopyWith<$Res> {
  _$BackupFailureCopyWithImpl(this._self, this._then);

  final BackupFailure _self;
  final $Res Function(BackupFailure) _then;

/// Create a copy of BackupResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BackupFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
