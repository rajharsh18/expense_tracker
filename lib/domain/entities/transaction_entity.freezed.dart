// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionEntity {

 int? get id; int get accountId; int get categoryId; String get date; String get time; int get amount; String get name; String get category; String get remark; String get paymentMode; String get lastEditedDate; String get lastEditedTime; String get imageUris; String get type; int get isHeader; int get isBookmarked; String? get fromAccount; String? get toAccount; String? get transferType;
/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionEntityCopyWith<TransactionEntity> get copyWith => _$TransactionEntityCopyWithImpl<TransactionEntity>(this as TransactionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.remark, remark) || other.remark == remark)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.lastEditedDate, lastEditedDate) || other.lastEditedDate == lastEditedDate)&&(identical(other.lastEditedTime, lastEditedTime) || other.lastEditedTime == lastEditedTime)&&(identical(other.imageUris, imageUris) || other.imageUris == imageUris)&&(identical(other.type, type) || other.type == type)&&(identical(other.isHeader, isHeader) || other.isHeader == isHeader)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.fromAccount, fromAccount) || other.fromAccount == fromAccount)&&(identical(other.toAccount, toAccount) || other.toAccount == toAccount)&&(identical(other.transferType, transferType) || other.transferType == transferType));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,accountId,categoryId,date,time,amount,name,category,remark,paymentMode,lastEditedDate,lastEditedTime,imageUris,type,isHeader,isBookmarked,fromAccount,toAccount,transferType]);

@override
String toString() {
  return 'TransactionEntity(id: $id, accountId: $accountId, categoryId: $categoryId, date: $date, time: $time, amount: $amount, name: $name, category: $category, remark: $remark, paymentMode: $paymentMode, lastEditedDate: $lastEditedDate, lastEditedTime: $lastEditedTime, imageUris: $imageUris, type: $type, isHeader: $isHeader, isBookmarked: $isBookmarked, fromAccount: $fromAccount, toAccount: $toAccount, transferType: $transferType)';
}


}

/// @nodoc
abstract mixin class $TransactionEntityCopyWith<$Res>  {
  factory $TransactionEntityCopyWith(TransactionEntity value, $Res Function(TransactionEntity) _then) = _$TransactionEntityCopyWithImpl;
@useResult
$Res call({
 int? id, int accountId, int categoryId, String date, String time, int amount, String name, String category, String remark, String paymentMode, String lastEditedDate, String lastEditedTime, String imageUris, String type, int isHeader, int isBookmarked, String? fromAccount, String? toAccount, String? transferType
});




}
/// @nodoc
class _$TransactionEntityCopyWithImpl<$Res>
    implements $TransactionEntityCopyWith<$Res> {
  _$TransactionEntityCopyWithImpl(this._self, this._then);

  final TransactionEntity _self;
  final $Res Function(TransactionEntity) _then;

/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? accountId = null,Object? categoryId = null,Object? date = null,Object? time = null,Object? amount = null,Object? name = null,Object? category = null,Object? remark = null,Object? paymentMode = null,Object? lastEditedDate = null,Object? lastEditedTime = null,Object? imageUris = null,Object? type = null,Object? isHeader = null,Object? isBookmarked = null,Object? fromAccount = freezed,Object? toAccount = freezed,Object? transferType = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,remark: null == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String,paymentMode: null == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String,lastEditedDate: null == lastEditedDate ? _self.lastEditedDate : lastEditedDate // ignore: cast_nullable_to_non_nullable
as String,lastEditedTime: null == lastEditedTime ? _self.lastEditedTime : lastEditedTime // ignore: cast_nullable_to_non_nullable
as String,imageUris: null == imageUris ? _self.imageUris : imageUris // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isHeader: null == isHeader ? _self.isHeader : isHeader // ignore: cast_nullable_to_non_nullable
as int,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as int,fromAccount: freezed == fromAccount ? _self.fromAccount : fromAccount // ignore: cast_nullable_to_non_nullable
as String?,toAccount: freezed == toAccount ? _self.toAccount : toAccount // ignore: cast_nullable_to_non_nullable
as String?,transferType: freezed == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionEntity].
extension TransactionEntityPatterns on TransactionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionEntity value)  $default,){
final _that = this;
switch (_that) {
case _TransactionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int accountId,  int categoryId,  String date,  String time,  int amount,  String name,  String category,  String remark,  String paymentMode,  String lastEditedDate,  String lastEditedTime,  String imageUris,  String type,  int isHeader,  int isBookmarked,  String? fromAccount,  String? toAccount,  String? transferType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
return $default(_that.id,_that.accountId,_that.categoryId,_that.date,_that.time,_that.amount,_that.name,_that.category,_that.remark,_that.paymentMode,_that.lastEditedDate,_that.lastEditedTime,_that.imageUris,_that.type,_that.isHeader,_that.isBookmarked,_that.fromAccount,_that.toAccount,_that.transferType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int accountId,  int categoryId,  String date,  String time,  int amount,  String name,  String category,  String remark,  String paymentMode,  String lastEditedDate,  String lastEditedTime,  String imageUris,  String type,  int isHeader,  int isBookmarked,  String? fromAccount,  String? toAccount,  String? transferType)  $default,) {final _that = this;
switch (_that) {
case _TransactionEntity():
return $default(_that.id,_that.accountId,_that.categoryId,_that.date,_that.time,_that.amount,_that.name,_that.category,_that.remark,_that.paymentMode,_that.lastEditedDate,_that.lastEditedTime,_that.imageUris,_that.type,_that.isHeader,_that.isBookmarked,_that.fromAccount,_that.toAccount,_that.transferType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int accountId,  int categoryId,  String date,  String time,  int amount,  String name,  String category,  String remark,  String paymentMode,  String lastEditedDate,  String lastEditedTime,  String imageUris,  String type,  int isHeader,  int isBookmarked,  String? fromAccount,  String? toAccount,  String? transferType)?  $default,) {final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
return $default(_that.id,_that.accountId,_that.categoryId,_that.date,_that.time,_that.amount,_that.name,_that.category,_that.remark,_that.paymentMode,_that.lastEditedDate,_that.lastEditedTime,_that.imageUris,_that.type,_that.isHeader,_that.isBookmarked,_that.fromAccount,_that.toAccount,_that.transferType);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionEntity extends TransactionEntity {
  const _TransactionEntity({this.id, required this.accountId, required this.categoryId, required this.date, required this.time, required this.amount, required this.name, required this.category, required this.remark, required this.paymentMode, required this.lastEditedDate, required this.lastEditedTime, required this.imageUris, required this.type, required this.isHeader, this.isBookmarked = 0, this.fromAccount, this.toAccount, this.transferType}): super._();
  

@override final  int? id;
@override final  int accountId;
@override final  int categoryId;
@override final  String date;
@override final  String time;
@override final  int amount;
@override final  String name;
@override final  String category;
@override final  String remark;
@override final  String paymentMode;
@override final  String lastEditedDate;
@override final  String lastEditedTime;
@override final  String imageUris;
@override final  String type;
@override final  int isHeader;
@override@JsonKey() final  int isBookmarked;
@override final  String? fromAccount;
@override final  String? toAccount;
@override final  String? transferType;

/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionEntityCopyWith<_TransactionEntity> get copyWith => __$TransactionEntityCopyWithImpl<_TransactionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.remark, remark) || other.remark == remark)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.lastEditedDate, lastEditedDate) || other.lastEditedDate == lastEditedDate)&&(identical(other.lastEditedTime, lastEditedTime) || other.lastEditedTime == lastEditedTime)&&(identical(other.imageUris, imageUris) || other.imageUris == imageUris)&&(identical(other.type, type) || other.type == type)&&(identical(other.isHeader, isHeader) || other.isHeader == isHeader)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.fromAccount, fromAccount) || other.fromAccount == fromAccount)&&(identical(other.toAccount, toAccount) || other.toAccount == toAccount)&&(identical(other.transferType, transferType) || other.transferType == transferType));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,accountId,categoryId,date,time,amount,name,category,remark,paymentMode,lastEditedDate,lastEditedTime,imageUris,type,isHeader,isBookmarked,fromAccount,toAccount,transferType]);

@override
String toString() {
  return 'TransactionEntity(id: $id, accountId: $accountId, categoryId: $categoryId, date: $date, time: $time, amount: $amount, name: $name, category: $category, remark: $remark, paymentMode: $paymentMode, lastEditedDate: $lastEditedDate, lastEditedTime: $lastEditedTime, imageUris: $imageUris, type: $type, isHeader: $isHeader, isBookmarked: $isBookmarked, fromAccount: $fromAccount, toAccount: $toAccount, transferType: $transferType)';
}


}

/// @nodoc
abstract mixin class _$TransactionEntityCopyWith<$Res> implements $TransactionEntityCopyWith<$Res> {
  factory _$TransactionEntityCopyWith(_TransactionEntity value, $Res Function(_TransactionEntity) _then) = __$TransactionEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, int accountId, int categoryId, String date, String time, int amount, String name, String category, String remark, String paymentMode, String lastEditedDate, String lastEditedTime, String imageUris, String type, int isHeader, int isBookmarked, String? fromAccount, String? toAccount, String? transferType
});




}
/// @nodoc
class __$TransactionEntityCopyWithImpl<$Res>
    implements _$TransactionEntityCopyWith<$Res> {
  __$TransactionEntityCopyWithImpl(this._self, this._then);

  final _TransactionEntity _self;
  final $Res Function(_TransactionEntity) _then;

/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? accountId = null,Object? categoryId = null,Object? date = null,Object? time = null,Object? amount = null,Object? name = null,Object? category = null,Object? remark = null,Object? paymentMode = null,Object? lastEditedDate = null,Object? lastEditedTime = null,Object? imageUris = null,Object? type = null,Object? isHeader = null,Object? isBookmarked = null,Object? fromAccount = freezed,Object? toAccount = freezed,Object? transferType = freezed,}) {
  return _then(_TransactionEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,remark: null == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String,paymentMode: null == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String,lastEditedDate: null == lastEditedDate ? _self.lastEditedDate : lastEditedDate // ignore: cast_nullable_to_non_nullable
as String,lastEditedTime: null == lastEditedTime ? _self.lastEditedTime : lastEditedTime // ignore: cast_nullable_to_non_nullable
as String,imageUris: null == imageUris ? _self.imageUris : imageUris // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isHeader: null == isHeader ? _self.isHeader : isHeader // ignore: cast_nullable_to_non_nullable
as int,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as int,fromAccount: freezed == fromAccount ? _self.fromAccount : fromAccount // ignore: cast_nullable_to_non_nullable
as String?,toAccount: freezed == toAccount ? _self.toAccount : toAccount // ignore: cast_nullable_to_non_nullable
as String?,transferType: freezed == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$AccountEntity {

 int? get id; String get entryName; String get dateTime;
/// Create a copy of AccountEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountEntityCopyWith<AccountEntity> get copyWith => _$AccountEntityCopyWithImpl<AccountEntity>(this as AccountEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.entryName, entryName) || other.entryName == entryName)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,entryName,dateTime);

@override
String toString() {
  return 'AccountEntity(id: $id, entryName: $entryName, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class $AccountEntityCopyWith<$Res>  {
  factory $AccountEntityCopyWith(AccountEntity value, $Res Function(AccountEntity) _then) = _$AccountEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String entryName, String dateTime
});




}
/// @nodoc
class _$AccountEntityCopyWithImpl<$Res>
    implements $AccountEntityCopyWith<$Res> {
  _$AccountEntityCopyWithImpl(this._self, this._then);

  final AccountEntity _self;
  final $Res Function(AccountEntity) _then;

/// Create a copy of AccountEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? entryName = null,Object? dateTime = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,entryName: null == entryName ? _self.entryName : entryName // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountEntity].
extension AccountEntityPatterns on AccountEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountEntity value)  $default,){
final _that = this;
switch (_that) {
case _AccountEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AccountEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String entryName,  String dateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountEntity() when $default != null:
return $default(_that.id,_that.entryName,_that.dateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String entryName,  String dateTime)  $default,) {final _that = this;
switch (_that) {
case _AccountEntity():
return $default(_that.id,_that.entryName,_that.dateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String entryName,  String dateTime)?  $default,) {final _that = this;
switch (_that) {
case _AccountEntity() when $default != null:
return $default(_that.id,_that.entryName,_that.dateTime);case _:
  return null;

}
}

}

/// @nodoc


class _AccountEntity implements AccountEntity {
  const _AccountEntity({this.id, required this.entryName, required this.dateTime});
  

@override final  int? id;
@override final  String entryName;
@override final  String dateTime;

/// Create a copy of AccountEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountEntityCopyWith<_AccountEntity> get copyWith => __$AccountEntityCopyWithImpl<_AccountEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.entryName, entryName) || other.entryName == entryName)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,entryName,dateTime);

@override
String toString() {
  return 'AccountEntity(id: $id, entryName: $entryName, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class _$AccountEntityCopyWith<$Res> implements $AccountEntityCopyWith<$Res> {
  factory _$AccountEntityCopyWith(_AccountEntity value, $Res Function(_AccountEntity) _then) = __$AccountEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String entryName, String dateTime
});




}
/// @nodoc
class __$AccountEntityCopyWithImpl<$Res>
    implements _$AccountEntityCopyWith<$Res> {
  __$AccountEntityCopyWithImpl(this._self, this._then);

  final _AccountEntity _self;
  final $Res Function(_AccountEntity) _then;

/// Create a copy of AccountEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? entryName = null,Object? dateTime = null,}) {
  return _then(_AccountEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,entryName: null == entryName ? _self.entryName : entryName // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CategoryEntity {

 int? get id; String get categoryName;
/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryEntityCopyWith<CategoryEntity> get copyWith => _$CategoryEntityCopyWithImpl<CategoryEntity>(this as CategoryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryName);

@override
String toString() {
  return 'CategoryEntity(id: $id, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class $CategoryEntityCopyWith<$Res>  {
  factory $CategoryEntityCopyWith(CategoryEntity value, $Res Function(CategoryEntity) _then) = _$CategoryEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String categoryName
});




}
/// @nodoc
class _$CategoryEntityCopyWithImpl<$Res>
    implements $CategoryEntityCopyWith<$Res> {
  _$CategoryEntityCopyWithImpl(this._self, this._then);

  final CategoryEntity _self;
  final $Res Function(CategoryEntity) _then;

/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoryName = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryEntity].
extension CategoryEntityPatterns on CategoryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _CategoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String categoryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryEntity() when $default != null:
return $default(_that.id,_that.categoryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String categoryName)  $default,) {final _that = this;
switch (_that) {
case _CategoryEntity():
return $default(_that.id,_that.categoryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String categoryName)?  $default,) {final _that = this;
switch (_that) {
case _CategoryEntity() when $default != null:
return $default(_that.id,_that.categoryName);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryEntity implements CategoryEntity {
  const _CategoryEntity({this.id, required this.categoryName});
  

@override final  int? id;
@override final  String categoryName;

/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryEntityCopyWith<_CategoryEntity> get copyWith => __$CategoryEntityCopyWithImpl<_CategoryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryName);

@override
String toString() {
  return 'CategoryEntity(id: $id, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class _$CategoryEntityCopyWith<$Res> implements $CategoryEntityCopyWith<$Res> {
  factory _$CategoryEntityCopyWith(_CategoryEntity value, $Res Function(_CategoryEntity) _then) = __$CategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String categoryName
});




}
/// @nodoc
class __$CategoryEntityCopyWithImpl<$Res>
    implements _$CategoryEntityCopyWith<$Res> {
  __$CategoryEntityCopyWithImpl(this._self, this._then);

  final _CategoryEntity _self;
  final $Res Function(_CategoryEntity) _then;

/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoryName = null,}) {
  return _then(_CategoryEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PayModeEntity {

 int? get id; String get payModeName;
/// Create a copy of PayModeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayModeEntityCopyWith<PayModeEntity> get copyWith => _$PayModeEntityCopyWithImpl<PayModeEntity>(this as PayModeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayModeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.payModeName, payModeName) || other.payModeName == payModeName));
}


@override
int get hashCode => Object.hash(runtimeType,id,payModeName);

@override
String toString() {
  return 'PayModeEntity(id: $id, payModeName: $payModeName)';
}


}

/// @nodoc
abstract mixin class $PayModeEntityCopyWith<$Res>  {
  factory $PayModeEntityCopyWith(PayModeEntity value, $Res Function(PayModeEntity) _then) = _$PayModeEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String payModeName
});




}
/// @nodoc
class _$PayModeEntityCopyWithImpl<$Res>
    implements $PayModeEntityCopyWith<$Res> {
  _$PayModeEntityCopyWithImpl(this._self, this._then);

  final PayModeEntity _self;
  final $Res Function(PayModeEntity) _then;

/// Create a copy of PayModeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? payModeName = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,payModeName: null == payModeName ? _self.payModeName : payModeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PayModeEntity].
extension PayModeEntityPatterns on PayModeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayModeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayModeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayModeEntity value)  $default,){
final _that = this;
switch (_that) {
case _PayModeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayModeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PayModeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String payModeName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayModeEntity() when $default != null:
return $default(_that.id,_that.payModeName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String payModeName)  $default,) {final _that = this;
switch (_that) {
case _PayModeEntity():
return $default(_that.id,_that.payModeName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String payModeName)?  $default,) {final _that = this;
switch (_that) {
case _PayModeEntity() when $default != null:
return $default(_that.id,_that.payModeName);case _:
  return null;

}
}

}

/// @nodoc


class _PayModeEntity implements PayModeEntity {
  const _PayModeEntity({this.id, required this.payModeName});
  

@override final  int? id;
@override final  String payModeName;

/// Create a copy of PayModeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayModeEntityCopyWith<_PayModeEntity> get copyWith => __$PayModeEntityCopyWithImpl<_PayModeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayModeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.payModeName, payModeName) || other.payModeName == payModeName));
}


@override
int get hashCode => Object.hash(runtimeType,id,payModeName);

@override
String toString() {
  return 'PayModeEntity(id: $id, payModeName: $payModeName)';
}


}

/// @nodoc
abstract mixin class _$PayModeEntityCopyWith<$Res> implements $PayModeEntityCopyWith<$Res> {
  factory _$PayModeEntityCopyWith(_PayModeEntity value, $Res Function(_PayModeEntity) _then) = __$PayModeEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String payModeName
});




}
/// @nodoc
class __$PayModeEntityCopyWithImpl<$Res>
    implements _$PayModeEntityCopyWith<$Res> {
  __$PayModeEntityCopyWithImpl(this._self, this._then);

  final _PayModeEntity _self;
  final $Res Function(_PayModeEntity) _then;

/// Create a copy of PayModeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? payModeName = null,}) {
  return _then(_PayModeEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,payModeName: null == payModeName ? _self.payModeName : payModeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ReminderEntity {

 String get id; String get name; String get frequency; String get date; String get time; String get note; int get isActive;
/// Create a copy of ReminderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderEntityCopyWith<ReminderEntity> get copyWith => _$ReminderEntityCopyWithImpl<ReminderEntity>(this as ReminderEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.note, note) || other.note == note)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,frequency,date,time,note,isActive);

@override
String toString() {
  return 'ReminderEntity(id: $id, name: $name, frequency: $frequency, date: $date, time: $time, note: $note, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ReminderEntityCopyWith<$Res>  {
  factory $ReminderEntityCopyWith(ReminderEntity value, $Res Function(ReminderEntity) _then) = _$ReminderEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String frequency, String date, String time, String note, int isActive
});




}
/// @nodoc
class _$ReminderEntityCopyWithImpl<$Res>
    implements $ReminderEntityCopyWith<$Res> {
  _$ReminderEntityCopyWithImpl(this._self, this._then);

  final ReminderEntity _self;
  final $Res Function(ReminderEntity) _then;

/// Create a copy of ReminderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? frequency = null,Object? date = null,Object? time = null,Object? note = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderEntity].
extension ReminderEntityPatterns on ReminderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderEntity value)  $default,){
final _that = this;
switch (_that) {
case _ReminderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String frequency,  String date,  String time,  String note,  int isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderEntity() when $default != null:
return $default(_that.id,_that.name,_that.frequency,_that.date,_that.time,_that.note,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String frequency,  String date,  String time,  String note,  int isActive)  $default,) {final _that = this;
switch (_that) {
case _ReminderEntity():
return $default(_that.id,_that.name,_that.frequency,_that.date,_that.time,_that.note,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String frequency,  String date,  String time,  String note,  int isActive)?  $default,) {final _that = this;
switch (_that) {
case _ReminderEntity() when $default != null:
return $default(_that.id,_that.name,_that.frequency,_that.date,_that.time,_that.note,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _ReminderEntity implements ReminderEntity {
  const _ReminderEntity({required this.id, required this.name, required this.frequency, required this.date, required this.time, required this.note, required this.isActive});
  

@override final  String id;
@override final  String name;
@override final  String frequency;
@override final  String date;
@override final  String time;
@override final  String note;
@override final  int isActive;

/// Create a copy of ReminderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderEntityCopyWith<_ReminderEntity> get copyWith => __$ReminderEntityCopyWithImpl<_ReminderEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.note, note) || other.note == note)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,frequency,date,time,note,isActive);

@override
String toString() {
  return 'ReminderEntity(id: $id, name: $name, frequency: $frequency, date: $date, time: $time, note: $note, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ReminderEntityCopyWith<$Res> implements $ReminderEntityCopyWith<$Res> {
  factory _$ReminderEntityCopyWith(_ReminderEntity value, $Res Function(_ReminderEntity) _then) = __$ReminderEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String frequency, String date, String time, String note, int isActive
});




}
/// @nodoc
class __$ReminderEntityCopyWithImpl<$Res>
    implements _$ReminderEntityCopyWith<$Res> {
  __$ReminderEntityCopyWithImpl(this._self, this._then);

  final _ReminderEntity _self;
  final $Res Function(_ReminderEntity) _then;

/// Create a copy of ReminderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? frequency = null,Object? date = null,Object? time = null,Object? note = null,Object? isActive = null,}) {
  return _then(_ReminderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$DashboardSummary {

 int get totalBalance; int get todayIncome; int get todayExpense; int get monthlyIncome; int get monthlyExpense; int get budgetLimit; int get budgetSpent;
/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryCopyWith<DashboardSummary> get copyWith => _$DashboardSummaryCopyWithImpl<DashboardSummary>(this as DashboardSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummary&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance)&&(identical(other.todayIncome, todayIncome) || other.todayIncome == todayIncome)&&(identical(other.todayExpense, todayExpense) || other.todayExpense == todayExpense)&&(identical(other.monthlyIncome, monthlyIncome) || other.monthlyIncome == monthlyIncome)&&(identical(other.monthlyExpense, monthlyExpense) || other.monthlyExpense == monthlyExpense)&&(identical(other.budgetLimit, budgetLimit) || other.budgetLimit == budgetLimit)&&(identical(other.budgetSpent, budgetSpent) || other.budgetSpent == budgetSpent));
}


@override
int get hashCode => Object.hash(runtimeType,totalBalance,todayIncome,todayExpense,monthlyIncome,monthlyExpense,budgetLimit,budgetSpent);

@override
String toString() {
  return 'DashboardSummary(totalBalance: $totalBalance, todayIncome: $todayIncome, todayExpense: $todayExpense, monthlyIncome: $monthlyIncome, monthlyExpense: $monthlyExpense, budgetLimit: $budgetLimit, budgetSpent: $budgetSpent)';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryCopyWith<$Res>  {
  factory $DashboardSummaryCopyWith(DashboardSummary value, $Res Function(DashboardSummary) _then) = _$DashboardSummaryCopyWithImpl;
@useResult
$Res call({
 int totalBalance, int todayIncome, int todayExpense, int monthlyIncome, int monthlyExpense, int budgetLimit, int budgetSpent
});




}
/// @nodoc
class _$DashboardSummaryCopyWithImpl<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  _$DashboardSummaryCopyWithImpl(this._self, this._then);

  final DashboardSummary _self;
  final $Res Function(DashboardSummary) _then;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBalance = null,Object? todayIncome = null,Object? todayExpense = null,Object? monthlyIncome = null,Object? monthlyExpense = null,Object? budgetLimit = null,Object? budgetSpent = null,}) {
  return _then(_self.copyWith(
totalBalance: null == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as int,todayIncome: null == todayIncome ? _self.todayIncome : todayIncome // ignore: cast_nullable_to_non_nullable
as int,todayExpense: null == todayExpense ? _self.todayExpense : todayExpense // ignore: cast_nullable_to_non_nullable
as int,monthlyIncome: null == monthlyIncome ? _self.monthlyIncome : monthlyIncome // ignore: cast_nullable_to_non_nullable
as int,monthlyExpense: null == monthlyExpense ? _self.monthlyExpense : monthlyExpense // ignore: cast_nullable_to_non_nullable
as int,budgetLimit: null == budgetLimit ? _self.budgetLimit : budgetLimit // ignore: cast_nullable_to_non_nullable
as int,budgetSpent: null == budgetSpent ? _self.budgetSpent : budgetSpent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardSummary].
extension DashboardSummaryPatterns on DashboardSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummary value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummary value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalBalance,  int todayIncome,  int todayExpense,  int monthlyIncome,  int monthlyExpense,  int budgetLimit,  int budgetSpent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
return $default(_that.totalBalance,_that.todayIncome,_that.todayExpense,_that.monthlyIncome,_that.monthlyExpense,_that.budgetLimit,_that.budgetSpent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalBalance,  int todayIncome,  int todayExpense,  int monthlyIncome,  int monthlyExpense,  int budgetLimit,  int budgetSpent)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummary():
return $default(_that.totalBalance,_that.todayIncome,_that.todayExpense,_that.monthlyIncome,_that.monthlyExpense,_that.budgetLimit,_that.budgetSpent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalBalance,  int todayIncome,  int todayExpense,  int monthlyIncome,  int monthlyExpense,  int budgetLimit,  int budgetSpent)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
return $default(_that.totalBalance,_that.todayIncome,_that.todayExpense,_that.monthlyIncome,_that.monthlyExpense,_that.budgetLimit,_that.budgetSpent);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardSummary implements DashboardSummary {
  const _DashboardSummary({required this.totalBalance, required this.todayIncome, required this.todayExpense, required this.monthlyIncome, required this.monthlyExpense, required this.budgetLimit, required this.budgetSpent});
  

@override final  int totalBalance;
@override final  int todayIncome;
@override final  int todayExpense;
@override final  int monthlyIncome;
@override final  int monthlyExpense;
@override final  int budgetLimit;
@override final  int budgetSpent;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryCopyWith<_DashboardSummary> get copyWith => __$DashboardSummaryCopyWithImpl<_DashboardSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummary&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance)&&(identical(other.todayIncome, todayIncome) || other.todayIncome == todayIncome)&&(identical(other.todayExpense, todayExpense) || other.todayExpense == todayExpense)&&(identical(other.monthlyIncome, monthlyIncome) || other.monthlyIncome == monthlyIncome)&&(identical(other.monthlyExpense, monthlyExpense) || other.monthlyExpense == monthlyExpense)&&(identical(other.budgetLimit, budgetLimit) || other.budgetLimit == budgetLimit)&&(identical(other.budgetSpent, budgetSpent) || other.budgetSpent == budgetSpent));
}


@override
int get hashCode => Object.hash(runtimeType,totalBalance,todayIncome,todayExpense,monthlyIncome,monthlyExpense,budgetLimit,budgetSpent);

@override
String toString() {
  return 'DashboardSummary(totalBalance: $totalBalance, todayIncome: $todayIncome, todayExpense: $todayExpense, monthlyIncome: $monthlyIncome, monthlyExpense: $monthlyExpense, budgetLimit: $budgetLimit, budgetSpent: $budgetSpent)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryCopyWith<$Res> implements $DashboardSummaryCopyWith<$Res> {
  factory _$DashboardSummaryCopyWith(_DashboardSummary value, $Res Function(_DashboardSummary) _then) = __$DashboardSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalBalance, int todayIncome, int todayExpense, int monthlyIncome, int monthlyExpense, int budgetLimit, int budgetSpent
});




}
/// @nodoc
class __$DashboardSummaryCopyWithImpl<$Res>
    implements _$DashboardSummaryCopyWith<$Res> {
  __$DashboardSummaryCopyWithImpl(this._self, this._then);

  final _DashboardSummary _self;
  final $Res Function(_DashboardSummary) _then;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBalance = null,Object? todayIncome = null,Object? todayExpense = null,Object? monthlyIncome = null,Object? monthlyExpense = null,Object? budgetLimit = null,Object? budgetSpent = null,}) {
  return _then(_DashboardSummary(
totalBalance: null == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as int,todayIncome: null == todayIncome ? _self.todayIncome : todayIncome // ignore: cast_nullable_to_non_nullable
as int,todayExpense: null == todayExpense ? _self.todayExpense : todayExpense // ignore: cast_nullable_to_non_nullable
as int,monthlyIncome: null == monthlyIncome ? _self.monthlyIncome : monthlyIncome // ignore: cast_nullable_to_non_nullable
as int,monthlyExpense: null == monthlyExpense ? _self.monthlyExpense : monthlyExpense // ignore: cast_nullable_to_non_nullable
as int,budgetLimit: null == budgetLimit ? _self.budgetLimit : budgetLimit // ignore: cast_nullable_to_non_nullable
as int,budgetSpent: null == budgetSpent ? _self.budgetSpent : budgetSpent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ReportData {

 int get totalIncome; int get totalExpense; int get totalTransfer; Map<String, int> get categoryBreakdown; Map<String, int> get paymentModeBreakdown; Map<String, int> get accountBreakdown; List<ChartPoint> get dailyPoints;
/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDataCopyWith<ReportData> get copyWith => _$ReportDataCopyWithImpl<ReportData>(this as ReportData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportData&&(identical(other.totalIncome, totalIncome) || other.totalIncome == totalIncome)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&(identical(other.totalTransfer, totalTransfer) || other.totalTransfer == totalTransfer)&&const DeepCollectionEquality().equals(other.categoryBreakdown, categoryBreakdown)&&const DeepCollectionEquality().equals(other.paymentModeBreakdown, paymentModeBreakdown)&&const DeepCollectionEquality().equals(other.accountBreakdown, accountBreakdown)&&const DeepCollectionEquality().equals(other.dailyPoints, dailyPoints));
}


@override
int get hashCode => Object.hash(runtimeType,totalIncome,totalExpense,totalTransfer,const DeepCollectionEquality().hash(categoryBreakdown),const DeepCollectionEquality().hash(paymentModeBreakdown),const DeepCollectionEquality().hash(accountBreakdown),const DeepCollectionEquality().hash(dailyPoints));

@override
String toString() {
  return 'ReportData(totalIncome: $totalIncome, totalExpense: $totalExpense, totalTransfer: $totalTransfer, categoryBreakdown: $categoryBreakdown, paymentModeBreakdown: $paymentModeBreakdown, accountBreakdown: $accountBreakdown, dailyPoints: $dailyPoints)';
}


}

/// @nodoc
abstract mixin class $ReportDataCopyWith<$Res>  {
  factory $ReportDataCopyWith(ReportData value, $Res Function(ReportData) _then) = _$ReportDataCopyWithImpl;
@useResult
$Res call({
 int totalIncome, int totalExpense, int totalTransfer, Map<String, int> categoryBreakdown, Map<String, int> paymentModeBreakdown, Map<String, int> accountBreakdown, List<ChartPoint> dailyPoints
});




}
/// @nodoc
class _$ReportDataCopyWithImpl<$Res>
    implements $ReportDataCopyWith<$Res> {
  _$ReportDataCopyWithImpl(this._self, this._then);

  final ReportData _self;
  final $Res Function(ReportData) _then;

/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalIncome = null,Object? totalExpense = null,Object? totalTransfer = null,Object? categoryBreakdown = null,Object? paymentModeBreakdown = null,Object? accountBreakdown = null,Object? dailyPoints = null,}) {
  return _then(_self.copyWith(
totalIncome: null == totalIncome ? _self.totalIncome : totalIncome // ignore: cast_nullable_to_non_nullable
as int,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as int,totalTransfer: null == totalTransfer ? _self.totalTransfer : totalTransfer // ignore: cast_nullable_to_non_nullable
as int,categoryBreakdown: null == categoryBreakdown ? _self.categoryBreakdown : categoryBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,paymentModeBreakdown: null == paymentModeBreakdown ? _self.paymentModeBreakdown : paymentModeBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,accountBreakdown: null == accountBreakdown ? _self.accountBreakdown : accountBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,dailyPoints: null == dailyPoints ? _self.dailyPoints : dailyPoints // ignore: cast_nullable_to_non_nullable
as List<ChartPoint>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportData].
extension ReportDataPatterns on ReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportData value)  $default,){
final _that = this;
switch (_that) {
case _ReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportData value)?  $default,){
final _that = this;
switch (_that) {
case _ReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalIncome,  int totalExpense,  int totalTransfer,  Map<String, int> categoryBreakdown,  Map<String, int> paymentModeBreakdown,  Map<String, int> accountBreakdown,  List<ChartPoint> dailyPoints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportData() when $default != null:
return $default(_that.totalIncome,_that.totalExpense,_that.totalTransfer,_that.categoryBreakdown,_that.paymentModeBreakdown,_that.accountBreakdown,_that.dailyPoints);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalIncome,  int totalExpense,  int totalTransfer,  Map<String, int> categoryBreakdown,  Map<String, int> paymentModeBreakdown,  Map<String, int> accountBreakdown,  List<ChartPoint> dailyPoints)  $default,) {final _that = this;
switch (_that) {
case _ReportData():
return $default(_that.totalIncome,_that.totalExpense,_that.totalTransfer,_that.categoryBreakdown,_that.paymentModeBreakdown,_that.accountBreakdown,_that.dailyPoints);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalIncome,  int totalExpense,  int totalTransfer,  Map<String, int> categoryBreakdown,  Map<String, int> paymentModeBreakdown,  Map<String, int> accountBreakdown,  List<ChartPoint> dailyPoints)?  $default,) {final _that = this;
switch (_that) {
case _ReportData() when $default != null:
return $default(_that.totalIncome,_that.totalExpense,_that.totalTransfer,_that.categoryBreakdown,_that.paymentModeBreakdown,_that.accountBreakdown,_that.dailyPoints);case _:
  return null;

}
}

}

/// @nodoc


class _ReportData implements ReportData {
  const _ReportData({required this.totalIncome, required this.totalExpense, required this.totalTransfer, required final  Map<String, int> categoryBreakdown, required final  Map<String, int> paymentModeBreakdown, required final  Map<String, int> accountBreakdown, required final  List<ChartPoint> dailyPoints}): _categoryBreakdown = categoryBreakdown,_paymentModeBreakdown = paymentModeBreakdown,_accountBreakdown = accountBreakdown,_dailyPoints = dailyPoints;
  

@override final  int totalIncome;
@override final  int totalExpense;
@override final  int totalTransfer;
 final  Map<String, int> _categoryBreakdown;
@override Map<String, int> get categoryBreakdown {
  if (_categoryBreakdown is EqualUnmodifiableMapView) return _categoryBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_categoryBreakdown);
}

 final  Map<String, int> _paymentModeBreakdown;
@override Map<String, int> get paymentModeBreakdown {
  if (_paymentModeBreakdown is EqualUnmodifiableMapView) return _paymentModeBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_paymentModeBreakdown);
}

 final  Map<String, int> _accountBreakdown;
@override Map<String, int> get accountBreakdown {
  if (_accountBreakdown is EqualUnmodifiableMapView) return _accountBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_accountBreakdown);
}

 final  List<ChartPoint> _dailyPoints;
@override List<ChartPoint> get dailyPoints {
  if (_dailyPoints is EqualUnmodifiableListView) return _dailyPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyPoints);
}


/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportDataCopyWith<_ReportData> get copyWith => __$ReportDataCopyWithImpl<_ReportData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportData&&(identical(other.totalIncome, totalIncome) || other.totalIncome == totalIncome)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&(identical(other.totalTransfer, totalTransfer) || other.totalTransfer == totalTransfer)&&const DeepCollectionEquality().equals(other._categoryBreakdown, _categoryBreakdown)&&const DeepCollectionEquality().equals(other._paymentModeBreakdown, _paymentModeBreakdown)&&const DeepCollectionEquality().equals(other._accountBreakdown, _accountBreakdown)&&const DeepCollectionEquality().equals(other._dailyPoints, _dailyPoints));
}


@override
int get hashCode => Object.hash(runtimeType,totalIncome,totalExpense,totalTransfer,const DeepCollectionEquality().hash(_categoryBreakdown),const DeepCollectionEquality().hash(_paymentModeBreakdown),const DeepCollectionEquality().hash(_accountBreakdown),const DeepCollectionEquality().hash(_dailyPoints));

@override
String toString() {
  return 'ReportData(totalIncome: $totalIncome, totalExpense: $totalExpense, totalTransfer: $totalTransfer, categoryBreakdown: $categoryBreakdown, paymentModeBreakdown: $paymentModeBreakdown, accountBreakdown: $accountBreakdown, dailyPoints: $dailyPoints)';
}


}

/// @nodoc
abstract mixin class _$ReportDataCopyWith<$Res> implements $ReportDataCopyWith<$Res> {
  factory _$ReportDataCopyWith(_ReportData value, $Res Function(_ReportData) _then) = __$ReportDataCopyWithImpl;
@override @useResult
$Res call({
 int totalIncome, int totalExpense, int totalTransfer, Map<String, int> categoryBreakdown, Map<String, int> paymentModeBreakdown, Map<String, int> accountBreakdown, List<ChartPoint> dailyPoints
});




}
/// @nodoc
class __$ReportDataCopyWithImpl<$Res>
    implements _$ReportDataCopyWith<$Res> {
  __$ReportDataCopyWithImpl(this._self, this._then);

  final _ReportData _self;
  final $Res Function(_ReportData) _then;

/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalIncome = null,Object? totalExpense = null,Object? totalTransfer = null,Object? categoryBreakdown = null,Object? paymentModeBreakdown = null,Object? accountBreakdown = null,Object? dailyPoints = null,}) {
  return _then(_ReportData(
totalIncome: null == totalIncome ? _self.totalIncome : totalIncome // ignore: cast_nullable_to_non_nullable
as int,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as int,totalTransfer: null == totalTransfer ? _self.totalTransfer : totalTransfer // ignore: cast_nullable_to_non_nullable
as int,categoryBreakdown: null == categoryBreakdown ? _self._categoryBreakdown : categoryBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,paymentModeBreakdown: null == paymentModeBreakdown ? _self._paymentModeBreakdown : paymentModeBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,accountBreakdown: null == accountBreakdown ? _self._accountBreakdown : accountBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,dailyPoints: null == dailyPoints ? _self._dailyPoints : dailyPoints // ignore: cast_nullable_to_non_nullable
as List<ChartPoint>,
  ));
}


}

/// @nodoc
mixin _$ChartPoint {

 String get label; int get income; int get expense;
/// Create a copy of ChartPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartPointCopyWith<ChartPoint> get copyWith => _$ChartPointCopyWithImpl<ChartPoint>(this as ChartPoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartPoint&&(identical(other.label, label) || other.label == label)&&(identical(other.income, income) || other.income == income)&&(identical(other.expense, expense) || other.expense == expense));
}


@override
int get hashCode => Object.hash(runtimeType,label,income,expense);

@override
String toString() {
  return 'ChartPoint(label: $label, income: $income, expense: $expense)';
}


}

/// @nodoc
abstract mixin class $ChartPointCopyWith<$Res>  {
  factory $ChartPointCopyWith(ChartPoint value, $Res Function(ChartPoint) _then) = _$ChartPointCopyWithImpl;
@useResult
$Res call({
 String label, int income, int expense
});




}
/// @nodoc
class _$ChartPointCopyWithImpl<$Res>
    implements $ChartPointCopyWith<$Res> {
  _$ChartPointCopyWithImpl(this._self, this._then);

  final ChartPoint _self;
  final $Res Function(ChartPoint) _then;

/// Create a copy of ChartPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? income = null,Object? expense = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartPoint].
extension ChartPointPatterns on ChartPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartPoint value)  $default,){
final _that = this;
switch (_that) {
case _ChartPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartPoint value)?  $default,){
final _that = this;
switch (_that) {
case _ChartPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  int income,  int expense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartPoint() when $default != null:
return $default(_that.label,_that.income,_that.expense);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  int income,  int expense)  $default,) {final _that = this;
switch (_that) {
case _ChartPoint():
return $default(_that.label,_that.income,_that.expense);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  int income,  int expense)?  $default,) {final _that = this;
switch (_that) {
case _ChartPoint() when $default != null:
return $default(_that.label,_that.income,_that.expense);case _:
  return null;

}
}

}

/// @nodoc


class _ChartPoint implements ChartPoint {
  const _ChartPoint({required this.label, required this.income, required this.expense});
  

@override final  String label;
@override final  int income;
@override final  int expense;

/// Create a copy of ChartPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartPointCopyWith<_ChartPoint> get copyWith => __$ChartPointCopyWithImpl<_ChartPoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartPoint&&(identical(other.label, label) || other.label == label)&&(identical(other.income, income) || other.income == income)&&(identical(other.expense, expense) || other.expense == expense));
}


@override
int get hashCode => Object.hash(runtimeType,label,income,expense);

@override
String toString() {
  return 'ChartPoint(label: $label, income: $income, expense: $expense)';
}


}

/// @nodoc
abstract mixin class _$ChartPointCopyWith<$Res> implements $ChartPointCopyWith<$Res> {
  factory _$ChartPointCopyWith(_ChartPoint value, $Res Function(_ChartPoint) _then) = __$ChartPointCopyWithImpl;
@override @useResult
$Res call({
 String label, int income, int expense
});




}
/// @nodoc
class __$ChartPointCopyWithImpl<$Res>
    implements _$ChartPointCopyWith<$Res> {
  __$ChartPointCopyWithImpl(this._self, this._then);

  final _ChartPoint _self;
  final $Res Function(_ChartPoint) _then;

/// Create a copy of ChartPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? income = null,Object? expense = null,}) {
  return _then(_ChartPoint(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as int,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$SearchFilter {

 String? get query; String? get type; int? get accountId; String? get category; String? get paymentMode; DateTime? get startDate; DateTime? get endDate; bool? get bookmarkedOnly; int? get minAmount; int? get maxAmount;
/// Create a copy of SearchFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchFilterCopyWith<SearchFilter> get copyWith => _$SearchFilterCopyWithImpl<SearchFilter>(this as SearchFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchFilter&&(identical(other.query, query) || other.query == query)&&(identical(other.type, type) || other.type == type)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.category, category) || other.category == category)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.bookmarkedOnly, bookmarkedOnly) || other.bookmarkedOnly == bookmarkedOnly)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.maxAmount, maxAmount) || other.maxAmount == maxAmount));
}


@override
int get hashCode => Object.hash(runtimeType,query,type,accountId,category,paymentMode,startDate,endDate,bookmarkedOnly,minAmount,maxAmount);

@override
String toString() {
  return 'SearchFilter(query: $query, type: $type, accountId: $accountId, category: $category, paymentMode: $paymentMode, startDate: $startDate, endDate: $endDate, bookmarkedOnly: $bookmarkedOnly, minAmount: $minAmount, maxAmount: $maxAmount)';
}


}

/// @nodoc
abstract mixin class $SearchFilterCopyWith<$Res>  {
  factory $SearchFilterCopyWith(SearchFilter value, $Res Function(SearchFilter) _then) = _$SearchFilterCopyWithImpl;
@useResult
$Res call({
 String? query, String? type, int? accountId, String? category, String? paymentMode, DateTime? startDate, DateTime? endDate, bool? bookmarkedOnly, int? minAmount, int? maxAmount
});




}
/// @nodoc
class _$SearchFilterCopyWithImpl<$Res>
    implements $SearchFilterCopyWith<$Res> {
  _$SearchFilterCopyWithImpl(this._self, this._then);

  final SearchFilter _self;
  final $Res Function(SearchFilter) _then;

/// Create a copy of SearchFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = freezed,Object? type = freezed,Object? accountId = freezed,Object? category = freezed,Object? paymentMode = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? bookmarkedOnly = freezed,Object? minAmount = freezed,Object? maxAmount = freezed,}) {
  return _then(_self.copyWith(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,bookmarkedOnly: freezed == bookmarkedOnly ? _self.bookmarkedOnly : bookmarkedOnly // ignore: cast_nullable_to_non_nullable
as bool?,minAmount: freezed == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as int?,maxAmount: freezed == maxAmount ? _self.maxAmount : maxAmount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchFilter].
extension SearchFilterPatterns on SearchFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchFilter value)  $default,){
final _that = this;
switch (_that) {
case _SearchFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchFilter value)?  $default,){
final _that = this;
switch (_that) {
case _SearchFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? query,  String? type,  int? accountId,  String? category,  String? paymentMode,  DateTime? startDate,  DateTime? endDate,  bool? bookmarkedOnly,  int? minAmount,  int? maxAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchFilter() when $default != null:
return $default(_that.query,_that.type,_that.accountId,_that.category,_that.paymentMode,_that.startDate,_that.endDate,_that.bookmarkedOnly,_that.minAmount,_that.maxAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? query,  String? type,  int? accountId,  String? category,  String? paymentMode,  DateTime? startDate,  DateTime? endDate,  bool? bookmarkedOnly,  int? minAmount,  int? maxAmount)  $default,) {final _that = this;
switch (_that) {
case _SearchFilter():
return $default(_that.query,_that.type,_that.accountId,_that.category,_that.paymentMode,_that.startDate,_that.endDate,_that.bookmarkedOnly,_that.minAmount,_that.maxAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? query,  String? type,  int? accountId,  String? category,  String? paymentMode,  DateTime? startDate,  DateTime? endDate,  bool? bookmarkedOnly,  int? minAmount,  int? maxAmount)?  $default,) {final _that = this;
switch (_that) {
case _SearchFilter() when $default != null:
return $default(_that.query,_that.type,_that.accountId,_that.category,_that.paymentMode,_that.startDate,_that.endDate,_that.bookmarkedOnly,_that.minAmount,_that.maxAmount);case _:
  return null;

}
}

}

/// @nodoc


class _SearchFilter implements SearchFilter {
  const _SearchFilter({this.query, this.type, this.accountId, this.category, this.paymentMode, this.startDate, this.endDate, this.bookmarkedOnly, this.minAmount, this.maxAmount});
  

@override final  String? query;
@override final  String? type;
@override final  int? accountId;
@override final  String? category;
@override final  String? paymentMode;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  bool? bookmarkedOnly;
@override final  int? minAmount;
@override final  int? maxAmount;

/// Create a copy of SearchFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchFilterCopyWith<_SearchFilter> get copyWith => __$SearchFilterCopyWithImpl<_SearchFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchFilter&&(identical(other.query, query) || other.query == query)&&(identical(other.type, type) || other.type == type)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.category, category) || other.category == category)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.bookmarkedOnly, bookmarkedOnly) || other.bookmarkedOnly == bookmarkedOnly)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.maxAmount, maxAmount) || other.maxAmount == maxAmount));
}


@override
int get hashCode => Object.hash(runtimeType,query,type,accountId,category,paymentMode,startDate,endDate,bookmarkedOnly,minAmount,maxAmount);

@override
String toString() {
  return 'SearchFilter(query: $query, type: $type, accountId: $accountId, category: $category, paymentMode: $paymentMode, startDate: $startDate, endDate: $endDate, bookmarkedOnly: $bookmarkedOnly, minAmount: $minAmount, maxAmount: $maxAmount)';
}


}

/// @nodoc
abstract mixin class _$SearchFilterCopyWith<$Res> implements $SearchFilterCopyWith<$Res> {
  factory _$SearchFilterCopyWith(_SearchFilter value, $Res Function(_SearchFilter) _then) = __$SearchFilterCopyWithImpl;
@override @useResult
$Res call({
 String? query, String? type, int? accountId, String? category, String? paymentMode, DateTime? startDate, DateTime? endDate, bool? bookmarkedOnly, int? minAmount, int? maxAmount
});




}
/// @nodoc
class __$SearchFilterCopyWithImpl<$Res>
    implements _$SearchFilterCopyWith<$Res> {
  __$SearchFilterCopyWithImpl(this._self, this._then);

  final _SearchFilter _self;
  final $Res Function(_SearchFilter) _then;

/// Create a copy of SearchFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = freezed,Object? type = freezed,Object? accountId = freezed,Object? category = freezed,Object? paymentMode = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? bookmarkedOnly = freezed,Object? minAmount = freezed,Object? maxAmount = freezed,}) {
  return _then(_SearchFilter(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,bookmarkedOnly: freezed == bookmarkedOnly ? _self.bookmarkedOnly : bookmarkedOnly // ignore: cast_nullable_to_non_nullable
as bool?,minAmount: freezed == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as int?,maxAmount: freezed == maxAmount ? _self.maxAmount : maxAmount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
