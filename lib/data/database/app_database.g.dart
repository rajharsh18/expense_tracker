// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryNameMeta = const VerificationMeta(
    'categoryName',
  );
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
    'category_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, categoryName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_name')) {
      context.handle(
        _categoryNameMeta,
        categoryName.isAcceptableOrUnknown(
          data['category_name']!,
          _categoryNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      categoryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_name'],
      )!,
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int id;
  final String categoryName;
  const CategoryTableData({required this.id, required this.categoryName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_name'] = Variable<String>(categoryName);
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      categoryName: Value(categoryName),
    );
  }

  factory CategoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      id: serializer.fromJson<int>(json['id']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryName': serializer.toJson<String>(categoryName),
    };
  }

  CategoryTableData copyWith({int? id, String? categoryName}) =>
      CategoryTableData(
        id: id ?? this.id,
        categoryName: categoryName ?? this.categoryName,
      );
  CategoryTableData copyWithCompanion(CategoryTableCompanion data) {
    return CategoryTableData(
      id: data.id.present ? data.id.value : this.id,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('id: $id, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.id == this.id &&
          other.categoryName == this.categoryName);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> id;
  final Value<String> categoryName;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String categoryName,
  }) : categoryName = Value(categoryName);
  static Insertable<CategoryTableData> custom({
    Expression<int>? id,
    Expression<String>? categoryName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryName != null) 'category_name': categoryName,
    });
  }

  CategoryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? categoryName,
  }) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }
}

class $PayModeTableTable extends PayModeTable
    with TableInfo<$PayModeTableTable, PayModeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PayModeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _payModeNameMeta = const VerificationMeta(
    'payModeName',
  );
  @override
  late final GeneratedColumn<String> payModeName = GeneratedColumn<String>(
    'pay_mode_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, payModeName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pay_mode_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PayModeTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pay_mode_name')) {
      context.handle(
        _payModeNameMeta,
        payModeName.isAcceptableOrUnknown(
          data['pay_mode_name']!,
          _payModeNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payModeNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PayModeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PayModeTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      payModeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pay_mode_name'],
      )!,
    );
  }

  @override
  $PayModeTableTable createAlias(String alias) {
    return $PayModeTableTable(attachedDatabase, alias);
  }
}

class PayModeTableData extends DataClass
    implements Insertable<PayModeTableData> {
  final int id;
  final String payModeName;
  const PayModeTableData({required this.id, required this.payModeName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pay_mode_name'] = Variable<String>(payModeName);
    return map;
  }

  PayModeTableCompanion toCompanion(bool nullToAbsent) {
    return PayModeTableCompanion(
      id: Value(id),
      payModeName: Value(payModeName),
    );
  }

  factory PayModeTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PayModeTableData(
      id: serializer.fromJson<int>(json['id']),
      payModeName: serializer.fromJson<String>(json['payModeName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'payModeName': serializer.toJson<String>(payModeName),
    };
  }

  PayModeTableData copyWith({int? id, String? payModeName}) => PayModeTableData(
    id: id ?? this.id,
    payModeName: payModeName ?? this.payModeName,
  );
  PayModeTableData copyWithCompanion(PayModeTableCompanion data) {
    return PayModeTableData(
      id: data.id.present ? data.id.value : this.id,
      payModeName: data.payModeName.present
          ? data.payModeName.value
          : this.payModeName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PayModeTableData(')
          ..write('id: $id, ')
          ..write('payModeName: $payModeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, payModeName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PayModeTableData &&
          other.id == this.id &&
          other.payModeName == this.payModeName);
}

class PayModeTableCompanion extends UpdateCompanion<PayModeTableData> {
  final Value<int> id;
  final Value<String> payModeName;
  const PayModeTableCompanion({
    this.id = const Value.absent(),
    this.payModeName = const Value.absent(),
  });
  PayModeTableCompanion.insert({
    this.id = const Value.absent(),
    required String payModeName,
  }) : payModeName = Value(payModeName);
  static Insertable<PayModeTableData> custom({
    Expression<int>? id,
    Expression<String>? payModeName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (payModeName != null) 'pay_mode_name': payModeName,
    });
  }

  PayModeTableCompanion copyWith({Value<int>? id, Value<String>? payModeName}) {
    return PayModeTableCompanion(
      id: id ?? this.id,
      payModeName: payModeName ?? this.payModeName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (payModeName.present) {
      map['pay_mode_name'] = Variable<String>(payModeName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PayModeTableCompanion(')
          ..write('id: $id, ')
          ..write('payModeName: $payModeName')
          ..write(')'))
        .toString();
  }
}

class $CurrencyDenominationsTable extends CurrencyDenominations
    with TableInfo<$CurrencyDenominationsTable, CurrencyDenomination> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyDenominationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _countryCodeMeta = const VerificationMeta(
    'countryCode',
  );
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
    'countryCode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _denominationValueMeta = const VerificationMeta(
    'denominationValue',
  );
  @override
  late final GeneratedColumn<double> denominationValue =
      GeneratedColumn<double>(
        'denominationValue',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<int> isEnabled = GeneratedColumn<int>(
    'isEnabled',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    countryCode,
    denominationValue,
    isEnabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency_denominations';
  @override
  VerificationContext validateIntegrity(
    Insertable<CurrencyDenomination> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('countryCode')) {
      context.handle(
        _countryCodeMeta,
        countryCode.isAcceptableOrUnknown(
          data['countryCode']!,
          _countryCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_countryCodeMeta);
    }
    if (data.containsKey('denominationValue')) {
      context.handle(
        _denominationValueMeta,
        denominationValue.isAcceptableOrUnknown(
          data['denominationValue']!,
          _denominationValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_denominationValueMeta);
    }
    if (data.containsKey('isEnabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['isEnabled']!, _isEnabledMeta),
      );
    } else if (isInserting) {
      context.missing(_isEnabledMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurrencyDenomination map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyDenomination(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      countryCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}countryCode'],
      )!,
      denominationValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}denominationValue'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}isEnabled'],
      )!,
    );
  }

  @override
  $CurrencyDenominationsTable createAlias(String alias) {
    return $CurrencyDenominationsTable(attachedDatabase, alias);
  }
}

class CurrencyDenomination extends DataClass
    implements Insertable<CurrencyDenomination> {
  final int id;
  final String countryCode;
  final double denominationValue;
  final int isEnabled;
  const CurrencyDenomination({
    required this.id,
    required this.countryCode,
    required this.denominationValue,
    required this.isEnabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['countryCode'] = Variable<String>(countryCode);
    map['denominationValue'] = Variable<double>(denominationValue);
    map['isEnabled'] = Variable<int>(isEnabled);
    return map;
  }

  CurrencyDenominationsCompanion toCompanion(bool nullToAbsent) {
    return CurrencyDenominationsCompanion(
      id: Value(id),
      countryCode: Value(countryCode),
      denominationValue: Value(denominationValue),
      isEnabled: Value(isEnabled),
    );
  }

  factory CurrencyDenomination.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyDenomination(
      id: serializer.fromJson<int>(json['id']),
      countryCode: serializer.fromJson<String>(json['countryCode']),
      denominationValue: serializer.fromJson<double>(json['denominationValue']),
      isEnabled: serializer.fromJson<int>(json['isEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'countryCode': serializer.toJson<String>(countryCode),
      'denominationValue': serializer.toJson<double>(denominationValue),
      'isEnabled': serializer.toJson<int>(isEnabled),
    };
  }

  CurrencyDenomination copyWith({
    int? id,
    String? countryCode,
    double? denominationValue,
    int? isEnabled,
  }) => CurrencyDenomination(
    id: id ?? this.id,
    countryCode: countryCode ?? this.countryCode,
    denominationValue: denominationValue ?? this.denominationValue,
    isEnabled: isEnabled ?? this.isEnabled,
  );
  CurrencyDenomination copyWithCompanion(CurrencyDenominationsCompanion data) {
    return CurrencyDenomination(
      id: data.id.present ? data.id.value : this.id,
      countryCode: data.countryCode.present
          ? data.countryCode.value
          : this.countryCode,
      denominationValue: data.denominationValue.present
          ? data.denominationValue.value
          : this.denominationValue,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyDenomination(')
          ..write('id: $id, ')
          ..write('countryCode: $countryCode, ')
          ..write('denominationValue: $denominationValue, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, countryCode, denominationValue, isEnabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyDenomination &&
          other.id == this.id &&
          other.countryCode == this.countryCode &&
          other.denominationValue == this.denominationValue &&
          other.isEnabled == this.isEnabled);
}

class CurrencyDenominationsCompanion
    extends UpdateCompanion<CurrencyDenomination> {
  final Value<int> id;
  final Value<String> countryCode;
  final Value<double> denominationValue;
  final Value<int> isEnabled;
  const CurrencyDenominationsCompanion({
    this.id = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.denominationValue = const Value.absent(),
    this.isEnabled = const Value.absent(),
  });
  CurrencyDenominationsCompanion.insert({
    this.id = const Value.absent(),
    required String countryCode,
    required double denominationValue,
    required int isEnabled,
  }) : countryCode = Value(countryCode),
       denominationValue = Value(denominationValue),
       isEnabled = Value(isEnabled);
  static Insertable<CurrencyDenomination> custom({
    Expression<int>? id,
    Expression<String>? countryCode,
    Expression<double>? denominationValue,
    Expression<int>? isEnabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countryCode != null) 'countryCode': countryCode,
      if (denominationValue != null) 'denominationValue': denominationValue,
      if (isEnabled != null) 'isEnabled': isEnabled,
    });
  }

  CurrencyDenominationsCompanion copyWith({
    Value<int>? id,
    Value<String>? countryCode,
    Value<double>? denominationValue,
    Value<int>? isEnabled,
  }) {
    return CurrencyDenominationsCompanion(
      id: id ?? this.id,
      countryCode: countryCode ?? this.countryCode,
      denominationValue: denominationValue ?? this.denominationValue,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (countryCode.present) {
      map['countryCode'] = Variable<String>(countryCode.value);
    }
    if (denominationValue.present) {
      map['denominationValue'] = Variable<double>(denominationValue.value);
    }
    if (isEnabled.present) {
      map['isEnabled'] = Variable<int>(isEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyDenominationsCompanion(')
          ..write('id: $id, ')
          ..write('countryCode: $countryCode, ')
          ..write('denominationValue: $denominationValue, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(attachedDatabase, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String name;
  const CategoryData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(id: Value(id), name: Value(name));
  }

  factory CategoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  CategoryData copyWith({int? id, String? name}) =>
      CategoryData(id: id ?? this.id, name: name ?? this.name);
  CategoryData copyWithCompanion(CategoryCompanion data) {
    return CategoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData && other.id == this.id && other.name == this.name);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String> name;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<CategoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CategoryCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CategoryCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SubCategoriesTable extends SubCategories
    with TableInfo<$SubCategoriesTable, SubCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _mainCategoryIdMeta = const VerificationMeta(
    'mainCategoryId',
  );
  @override
  late final GeneratedColumn<int> mainCategoryId = GeneratedColumn<int>(
    'mainCategoryId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, mainCategoryId, name, position];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sub_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mainCategoryId')) {
      context.handle(
        _mainCategoryIdMeta,
        mainCategoryId.isAcceptableOrUnknown(
          data['mainCategoryId']!,
          _mainCategoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainCategoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      mainCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mainCategoryId'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
    );
  }

  @override
  $SubCategoriesTable createAlias(String alias) {
    return $SubCategoriesTable(attachedDatabase, alias);
  }
}

class SubCategory extends DataClass implements Insertable<SubCategory> {
  final int id;
  final int mainCategoryId;
  final String name;
  final int position;
  const SubCategory({
    required this.id,
    required this.mainCategoryId,
    required this.name,
    required this.position,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mainCategoryId'] = Variable<int>(mainCategoryId);
    map['name'] = Variable<String>(name);
    map['position'] = Variable<int>(position);
    return map;
  }

  SubCategoriesCompanion toCompanion(bool nullToAbsent) {
    return SubCategoriesCompanion(
      id: Value(id),
      mainCategoryId: Value(mainCategoryId),
      name: Value(name),
      position: Value(position),
    );
  }

  factory SubCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubCategory(
      id: serializer.fromJson<int>(json['id']),
      mainCategoryId: serializer.fromJson<int>(json['mainCategoryId']),
      name: serializer.fromJson<String>(json['name']),
      position: serializer.fromJson<int>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mainCategoryId': serializer.toJson<int>(mainCategoryId),
      'name': serializer.toJson<String>(name),
      'position': serializer.toJson<int>(position),
    };
  }

  SubCategory copyWith({
    int? id,
    int? mainCategoryId,
    String? name,
    int? position,
  }) => SubCategory(
    id: id ?? this.id,
    mainCategoryId: mainCategoryId ?? this.mainCategoryId,
    name: name ?? this.name,
    position: position ?? this.position,
  );
  SubCategory copyWithCompanion(SubCategoriesCompanion data) {
    return SubCategory(
      id: data.id.present ? data.id.value : this.id,
      mainCategoryId: data.mainCategoryId.present
          ? data.mainCategoryId.value
          : this.mainCategoryId,
      name: data.name.present ? data.name.value : this.name,
      position: data.position.present ? data.position.value : this.position,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubCategory(')
          ..write('id: $id, ')
          ..write('mainCategoryId: $mainCategoryId, ')
          ..write('name: $name, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mainCategoryId, name, position);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubCategory &&
          other.id == this.id &&
          other.mainCategoryId == this.mainCategoryId &&
          other.name == this.name &&
          other.position == this.position);
}

class SubCategoriesCompanion extends UpdateCompanion<SubCategory> {
  final Value<int> id;
  final Value<int> mainCategoryId;
  final Value<String> name;
  final Value<int> position;
  const SubCategoriesCompanion({
    this.id = const Value.absent(),
    this.mainCategoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.position = const Value.absent(),
  });
  SubCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required int mainCategoryId,
    required String name,
    required int position,
  }) : mainCategoryId = Value(mainCategoryId),
       name = Value(name),
       position = Value(position);
  static Insertable<SubCategory> custom({
    Expression<int>? id,
    Expression<int>? mainCategoryId,
    Expression<String>? name,
    Expression<int>? position,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mainCategoryId != null) 'mainCategoryId': mainCategoryId,
      if (name != null) 'name': name,
      if (position != null) 'position': position,
    });
  }

  SubCategoriesCompanion copyWith({
    Value<int>? id,
    Value<int>? mainCategoryId,
    Value<String>? name,
    Value<int>? position,
  }) {
    return SubCategoriesCompanion(
      id: id ?? this.id,
      mainCategoryId: mainCategoryId ?? this.mainCategoryId,
      name: name ?? this.name,
      position: position ?? this.position,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mainCategoryId.present) {
      map['mainCategoryId'] = Variable<int>(mainCategoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('mainCategoryId: $mainCategoryId, ')
          ..write('name: $name, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }
}

class $AccountEntriesTable extends AccountEntries
    with TableInfo<$AccountEntriesTable, AccountEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entryNameMeta = const VerificationMeta(
    'entryName',
  );
  @override
  late final GeneratedColumn<String> entryName = GeneratedColumn<String>(
    'entryName',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entryDateTimeMeta = const VerificationMeta(
    'entryDateTime',
  );
  @override
  late final GeneratedColumn<String> entryDateTime = GeneratedColumn<String>(
    'dateTime',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, entryName, entryDateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccountEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entryName')) {
      context.handle(
        _entryNameMeta,
        entryName.isAcceptableOrUnknown(data['entryName']!, _entryNameMeta),
      );
    } else if (isInserting) {
      context.missing(_entryNameMeta);
    }
    if (data.containsKey('dateTime')) {
      context.handle(
        _entryDateTimeMeta,
        entryDateTime.isAcceptableOrUnknown(
          data['dateTime']!,
          _entryDateTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_entryDateTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entryName'],
      )!,
      entryDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dateTime'],
      )!,
    );
  }

  @override
  $AccountEntriesTable createAlias(String alias) {
    return $AccountEntriesTable(attachedDatabase, alias);
  }
}

class AccountEntry extends DataClass implements Insertable<AccountEntry> {
  final int id;
  final String entryName;
  final String entryDateTime;
  const AccountEntry({
    required this.id,
    required this.entryName,
    required this.entryDateTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entryName'] = Variable<String>(entryName);
    map['dateTime'] = Variable<String>(entryDateTime);
    return map;
  }

  AccountEntriesCompanion toCompanion(bool nullToAbsent) {
    return AccountEntriesCompanion(
      id: Value(id),
      entryName: Value(entryName),
      entryDateTime: Value(entryDateTime),
    );
  }

  factory AccountEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountEntry(
      id: serializer.fromJson<int>(json['id']),
      entryName: serializer.fromJson<String>(json['entryName']),
      entryDateTime: serializer.fromJson<String>(json['entryDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entryName': serializer.toJson<String>(entryName),
      'entryDateTime': serializer.toJson<String>(entryDateTime),
    };
  }

  AccountEntry copyWith({int? id, String? entryName, String? entryDateTime}) =>
      AccountEntry(
        id: id ?? this.id,
        entryName: entryName ?? this.entryName,
        entryDateTime: entryDateTime ?? this.entryDateTime,
      );
  AccountEntry copyWithCompanion(AccountEntriesCompanion data) {
    return AccountEntry(
      id: data.id.present ? data.id.value : this.id,
      entryName: data.entryName.present ? data.entryName.value : this.entryName,
      entryDateTime: data.entryDateTime.present
          ? data.entryDateTime.value
          : this.entryDateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountEntry(')
          ..write('id: $id, ')
          ..write('entryName: $entryName, ')
          ..write('entryDateTime: $entryDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entryName, entryDateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountEntry &&
          other.id == this.id &&
          other.entryName == this.entryName &&
          other.entryDateTime == this.entryDateTime);
}

class AccountEntriesCompanion extends UpdateCompanion<AccountEntry> {
  final Value<int> id;
  final Value<String> entryName;
  final Value<String> entryDateTime;
  const AccountEntriesCompanion({
    this.id = const Value.absent(),
    this.entryName = const Value.absent(),
    this.entryDateTime = const Value.absent(),
  });
  AccountEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String entryName,
    required String entryDateTime,
  }) : entryName = Value(entryName),
       entryDateTime = Value(entryDateTime);
  static Insertable<AccountEntry> custom({
    Expression<int>? id,
    Expression<String>? entryName,
    Expression<String>? entryDateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryName != null) 'entryName': entryName,
      if (entryDateTime != null) 'dateTime': entryDateTime,
    });
  }

  AccountEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? entryName,
    Value<String>? entryDateTime,
  }) {
    return AccountEntriesCompanion(
      id: id ?? this.id,
      entryName: entryName ?? this.entryName,
      entryDateTime: entryDateTime ?? this.entryDateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entryName.present) {
      map['entryName'] = Variable<String>(entryName.value);
    }
    if (entryDateTime.present) {
      map['dateTime'] = Variable<String>(entryDateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountEntriesCompanion(')
          ..write('id: $id, ')
          ..write('entryName: $entryName, ')
          ..write('entryDateTime: $entryDateTime')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'isActive',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    frequency,
    date,
    time,
    note,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('isActive')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['isActive']!, _isActiveMeta),
      );
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequency'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}time'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}isActive'],
      )!,
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final String id;
  final String name;
  final String frequency;
  final String date;
  final String time;
  final String note;
  final int isActive;
  const Reminder({
    required this.id,
    required this.name,
    required this.frequency,
    required this.date,
    required this.time,
    required this.note,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['frequency'] = Variable<String>(frequency);
    map['date'] = Variable<String>(date);
    map['time'] = Variable<String>(time);
    map['note'] = Variable<String>(note);
    map['isActive'] = Variable<int>(isActive);
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      name: Value(name),
      frequency: Value(frequency),
      date: Value(date),
      time: Value(time),
      note: Value(note),
      isActive: Value(isActive),
    );
  }

  factory Reminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      frequency: serializer.fromJson<String>(json['frequency']),
      date: serializer.fromJson<String>(json['date']),
      time: serializer.fromJson<String>(json['time']),
      note: serializer.fromJson<String>(json['note']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'frequency': serializer.toJson<String>(frequency),
      'date': serializer.toJson<String>(date),
      'time': serializer.toJson<String>(time),
      'note': serializer.toJson<String>(note),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  Reminder copyWith({
    String? id,
    String? name,
    String? frequency,
    String? date,
    String? time,
    String? note,
    int? isActive,
  }) => Reminder(
    id: id ?? this.id,
    name: name ?? this.name,
    frequency: frequency ?? this.frequency,
    date: date ?? this.date,
    time: time ?? this.time,
    note: note ?? this.note,
    isActive: isActive ?? this.isActive,
  );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      date: data.date.present ? data.date.value : this.date,
      time: data.time.present ? data.time.value : this.time,
      note: data.note.present ? data.note.value : this.note,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('frequency: $frequency, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('note: $note, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, frequency, date, time, note, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.name == this.name &&
          other.frequency == this.frequency &&
          other.date == this.date &&
          other.time == this.time &&
          other.note == this.note &&
          other.isActive == this.isActive);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> frequency;
  final Value<String> date;
  final Value<String> time;
  final Value<String> note;
  final Value<int> isActive;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.frequency = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
    this.note = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    required String id,
    required String name,
    required String frequency,
    required String date,
    required String time,
    required String note,
    required int isActive,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       frequency = Value(frequency),
       date = Value(date),
       time = Value(time),
       note = Value(note),
       isActive = Value(isActive);
  static Insertable<Reminder> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? frequency,
    Expression<String>? date,
    Expression<String>? time,
    Expression<String>? note,
    Expression<int>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (frequency != null) 'frequency': frequency,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
      if (note != null) 'note': note,
      if (isActive != null) 'isActive': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? frequency,
    Value<String>? date,
    Value<String>? time,
    Value<String>? note,
    Value<int>? isActive,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      frequency: frequency ?? this.frequency,
      date: date ?? this.date,
      time: time ?? this.time,
      note: note ?? this.note,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (isActive.present) {
      map['isActive'] = Variable<int>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('frequency: $frequency, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('note: $note, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IncomeTableTable extends IncomeTable
    with TableInfo<$IncomeTableTable, IncomeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'accountId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'categoryId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentModeMeta = const VerificationMeta(
    'paymentMode',
  );
  @override
  late final GeneratedColumn<String> paymentMode = GeneratedColumn<String>(
    'paymentMode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastEditedDateMeta = const VerificationMeta(
    'lastEditedDate',
  );
  @override
  late final GeneratedColumn<String> lastEditedDate = GeneratedColumn<String>(
    'lastEditedDate',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastEditedTimeMeta = const VerificationMeta(
    'lastEditedTime',
  );
  @override
  late final GeneratedColumn<String> lastEditedTime = GeneratedColumn<String>(
    'lastEditedTime',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrisMeta = const VerificationMeta(
    'imageUris',
  );
  @override
  late final GeneratedColumn<String> imageUris = GeneratedColumn<String>(
    'imageUris',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isHeaderMeta = const VerificationMeta(
    'isHeader',
  );
  @override
  late final GeneratedColumn<int> isHeader = GeneratedColumn<int>(
    'isHeader',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isBookmarkedMeta = const VerificationMeta(
    'isBookmarked',
  );
  @override
  late final GeneratedColumn<int> isBookmarked = GeneratedColumn<int>(
    'isBookmarked',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fromAccountMeta = const VerificationMeta(
    'fromAccount',
  );
  @override
  late final GeneratedColumn<String> fromAccount = GeneratedColumn<String>(
    'fromAccount',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _toAccountMeta = const VerificationMeta(
    'toAccount',
  );
  @override
  late final GeneratedColumn<String> toAccount = GeneratedColumn<String>(
    'toAccount',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _transferTypeMeta = const VerificationMeta(
    'transferType',
  );
  @override
  late final GeneratedColumn<String> transferType = GeneratedColumn<String>(
    'transferType',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    categoryId,
    date,
    time,
    amount,
    name,
    category,
    remark,
    paymentMode,
    lastEditedDate,
    lastEditedTime,
    imageUris,
    type,
    isHeader,
    isBookmarked,
    fromAccount,
    toAccount,
    transferType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'income_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<IncomeTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('accountId')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['accountId']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('categoryId')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['categoryId']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    if (data.containsKey('paymentMode')) {
      context.handle(
        _paymentModeMeta,
        paymentMode.isAcceptableOrUnknown(
          data['paymentMode']!,
          _paymentModeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentModeMeta);
    }
    if (data.containsKey('lastEditedDate')) {
      context.handle(
        _lastEditedDateMeta,
        lastEditedDate.isAcceptableOrUnknown(
          data['lastEditedDate']!,
          _lastEditedDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedDateMeta);
    }
    if (data.containsKey('lastEditedTime')) {
      context.handle(
        _lastEditedTimeMeta,
        lastEditedTime.isAcceptableOrUnknown(
          data['lastEditedTime']!,
          _lastEditedTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedTimeMeta);
    }
    if (data.containsKey('imageUris')) {
      context.handle(
        _imageUrisMeta,
        imageUris.isAcceptableOrUnknown(data['imageUris']!, _imageUrisMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrisMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('isHeader')) {
      context.handle(
        _isHeaderMeta,
        isHeader.isAcceptableOrUnknown(data['isHeader']!, _isHeaderMeta),
      );
    } else if (isInserting) {
      context.missing(_isHeaderMeta);
    }
    if (data.containsKey('isBookmarked')) {
      context.handle(
        _isBookmarkedMeta,
        isBookmarked.isAcceptableOrUnknown(
          data['isBookmarked']!,
          _isBookmarkedMeta,
        ),
      );
    }
    if (data.containsKey('fromAccount')) {
      context.handle(
        _fromAccountMeta,
        fromAccount.isAcceptableOrUnknown(
          data['fromAccount']!,
          _fromAccountMeta,
        ),
      );
    }
    if (data.containsKey('toAccount')) {
      context.handle(
        _toAccountMeta,
        toAccount.isAcceptableOrUnknown(data['toAccount']!, _toAccountMeta),
      );
    }
    if (data.containsKey('transferType')) {
      context.handle(
        _transferTypeMeta,
        transferType.isAcceptableOrUnknown(
          data['transferType']!,
          _transferTypeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}accountId'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}categoryId'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}time'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      )!,
      paymentMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}paymentMode'],
      )!,
      lastEditedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastEditedDate'],
      )!,
      lastEditedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastEditedTime'],
      )!,
      imageUris: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imageUris'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      isHeader: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}isHeader'],
      )!,
      isBookmarked: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}isBookmarked'],
      )!,
      fromAccount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fromAccount'],
      ),
      toAccount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}toAccount'],
      ),
      transferType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transferType'],
      ),
    );
  }

  @override
  $IncomeTableTable createAlias(String alias) {
    return $IncomeTableTable(attachedDatabase, alias);
  }
}

class IncomeTableData extends DataClass implements Insertable<IncomeTableData> {
  final int id;
  final int accountId;
  final int categoryId;
  final String date;
  final String time;
  final int amount;
  final String name;
  final String category;
  final String remark;
  final String paymentMode;
  final String lastEditedDate;
  final String lastEditedTime;
  final String imageUris;
  final String type;
  final int isHeader;
  final int isBookmarked;
  final String? fromAccount;
  final String? toAccount;
  final String? transferType;
  const IncomeTableData({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.date,
    required this.time,
    required this.amount,
    required this.name,
    required this.category,
    required this.remark,
    required this.paymentMode,
    required this.lastEditedDate,
    required this.lastEditedTime,
    required this.imageUris,
    required this.type,
    required this.isHeader,
    required this.isBookmarked,
    this.fromAccount,
    this.toAccount,
    this.transferType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['accountId'] = Variable<int>(accountId);
    map['categoryId'] = Variable<int>(categoryId);
    map['date'] = Variable<String>(date);
    map['time'] = Variable<String>(time);
    map['amount'] = Variable<int>(amount);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['remark'] = Variable<String>(remark);
    map['paymentMode'] = Variable<String>(paymentMode);
    map['lastEditedDate'] = Variable<String>(lastEditedDate);
    map['lastEditedTime'] = Variable<String>(lastEditedTime);
    map['imageUris'] = Variable<String>(imageUris);
    map['type'] = Variable<String>(type);
    map['isHeader'] = Variable<int>(isHeader);
    map['isBookmarked'] = Variable<int>(isBookmarked);
    if (!nullToAbsent || fromAccount != null) {
      map['fromAccount'] = Variable<String>(fromAccount);
    }
    if (!nullToAbsent || toAccount != null) {
      map['toAccount'] = Variable<String>(toAccount);
    }
    if (!nullToAbsent || transferType != null) {
      map['transferType'] = Variable<String>(transferType);
    }
    return map;
  }

  IncomeTableCompanion toCompanion(bool nullToAbsent) {
    return IncomeTableCompanion(
      id: Value(id),
      accountId: Value(accountId),
      categoryId: Value(categoryId),
      date: Value(date),
      time: Value(time),
      amount: Value(amount),
      name: Value(name),
      category: Value(category),
      remark: Value(remark),
      paymentMode: Value(paymentMode),
      lastEditedDate: Value(lastEditedDate),
      lastEditedTime: Value(lastEditedTime),
      imageUris: Value(imageUris),
      type: Value(type),
      isHeader: Value(isHeader),
      isBookmarked: Value(isBookmarked),
      fromAccount: fromAccount == null && nullToAbsent
          ? const Value.absent()
          : Value(fromAccount),
      toAccount: toAccount == null && nullToAbsent
          ? const Value.absent()
          : Value(toAccount),
      transferType: transferType == null && nullToAbsent
          ? const Value.absent()
          : Value(transferType),
    );
  }

  factory IncomeTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeTableData(
      id: serializer.fromJson<int>(json['id']),
      accountId: serializer.fromJson<int>(json['accountId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      date: serializer.fromJson<String>(json['date']),
      time: serializer.fromJson<String>(json['time']),
      amount: serializer.fromJson<int>(json['amount']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      remark: serializer.fromJson<String>(json['remark']),
      paymentMode: serializer.fromJson<String>(json['paymentMode']),
      lastEditedDate: serializer.fromJson<String>(json['lastEditedDate']),
      lastEditedTime: serializer.fromJson<String>(json['lastEditedTime']),
      imageUris: serializer.fromJson<String>(json['imageUris']),
      type: serializer.fromJson<String>(json['type']),
      isHeader: serializer.fromJson<int>(json['isHeader']),
      isBookmarked: serializer.fromJson<int>(json['isBookmarked']),
      fromAccount: serializer.fromJson<String?>(json['fromAccount']),
      toAccount: serializer.fromJson<String?>(json['toAccount']),
      transferType: serializer.fromJson<String?>(json['transferType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountId': serializer.toJson<int>(accountId),
      'categoryId': serializer.toJson<int>(categoryId),
      'date': serializer.toJson<String>(date),
      'time': serializer.toJson<String>(time),
      'amount': serializer.toJson<int>(amount),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'remark': serializer.toJson<String>(remark),
      'paymentMode': serializer.toJson<String>(paymentMode),
      'lastEditedDate': serializer.toJson<String>(lastEditedDate),
      'lastEditedTime': serializer.toJson<String>(lastEditedTime),
      'imageUris': serializer.toJson<String>(imageUris),
      'type': serializer.toJson<String>(type),
      'isHeader': serializer.toJson<int>(isHeader),
      'isBookmarked': serializer.toJson<int>(isBookmarked),
      'fromAccount': serializer.toJson<String?>(fromAccount),
      'toAccount': serializer.toJson<String?>(toAccount),
      'transferType': serializer.toJson<String?>(transferType),
    };
  }

  IncomeTableData copyWith({
    int? id,
    int? accountId,
    int? categoryId,
    String? date,
    String? time,
    int? amount,
    String? name,
    String? category,
    String? remark,
    String? paymentMode,
    String? lastEditedDate,
    String? lastEditedTime,
    String? imageUris,
    String? type,
    int? isHeader,
    int? isBookmarked,
    Value<String?> fromAccount = const Value.absent(),
    Value<String?> toAccount = const Value.absent(),
    Value<String?> transferType = const Value.absent(),
  }) => IncomeTableData(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    categoryId: categoryId ?? this.categoryId,
    date: date ?? this.date,
    time: time ?? this.time,
    amount: amount ?? this.amount,
    name: name ?? this.name,
    category: category ?? this.category,
    remark: remark ?? this.remark,
    paymentMode: paymentMode ?? this.paymentMode,
    lastEditedDate: lastEditedDate ?? this.lastEditedDate,
    lastEditedTime: lastEditedTime ?? this.lastEditedTime,
    imageUris: imageUris ?? this.imageUris,
    type: type ?? this.type,
    isHeader: isHeader ?? this.isHeader,
    isBookmarked: isBookmarked ?? this.isBookmarked,
    fromAccount: fromAccount.present ? fromAccount.value : this.fromAccount,
    toAccount: toAccount.present ? toAccount.value : this.toAccount,
    transferType: transferType.present ? transferType.value : this.transferType,
  );
  IncomeTableData copyWithCompanion(IncomeTableCompanion data) {
    return IncomeTableData(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      date: data.date.present ? data.date.value : this.date,
      time: data.time.present ? data.time.value : this.time,
      amount: data.amount.present ? data.amount.value : this.amount,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      remark: data.remark.present ? data.remark.value : this.remark,
      paymentMode: data.paymentMode.present
          ? data.paymentMode.value
          : this.paymentMode,
      lastEditedDate: data.lastEditedDate.present
          ? data.lastEditedDate.value
          : this.lastEditedDate,
      lastEditedTime: data.lastEditedTime.present
          ? data.lastEditedTime.value
          : this.lastEditedTime,
      imageUris: data.imageUris.present ? data.imageUris.value : this.imageUris,
      type: data.type.present ? data.type.value : this.type,
      isHeader: data.isHeader.present ? data.isHeader.value : this.isHeader,
      isBookmarked: data.isBookmarked.present
          ? data.isBookmarked.value
          : this.isBookmarked,
      fromAccount: data.fromAccount.present
          ? data.fromAccount.value
          : this.fromAccount,
      toAccount: data.toAccount.present ? data.toAccount.value : this.toAccount,
      transferType: data.transferType.present
          ? data.transferType.value
          : this.transferType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeTableData(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('amount: $amount, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('remark: $remark, ')
          ..write('paymentMode: $paymentMode, ')
          ..write('lastEditedDate: $lastEditedDate, ')
          ..write('lastEditedTime: $lastEditedTime, ')
          ..write('imageUris: $imageUris, ')
          ..write('type: $type, ')
          ..write('isHeader: $isHeader, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('fromAccount: $fromAccount, ')
          ..write('toAccount: $toAccount, ')
          ..write('transferType: $transferType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accountId,
    categoryId,
    date,
    time,
    amount,
    name,
    category,
    remark,
    paymentMode,
    lastEditedDate,
    lastEditedTime,
    imageUris,
    type,
    isHeader,
    isBookmarked,
    fromAccount,
    toAccount,
    transferType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeTableData &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.categoryId == this.categoryId &&
          other.date == this.date &&
          other.time == this.time &&
          other.amount == this.amount &&
          other.name == this.name &&
          other.category == this.category &&
          other.remark == this.remark &&
          other.paymentMode == this.paymentMode &&
          other.lastEditedDate == this.lastEditedDate &&
          other.lastEditedTime == this.lastEditedTime &&
          other.imageUris == this.imageUris &&
          other.type == this.type &&
          other.isHeader == this.isHeader &&
          other.isBookmarked == this.isBookmarked &&
          other.fromAccount == this.fromAccount &&
          other.toAccount == this.toAccount &&
          other.transferType == this.transferType);
}

class IncomeTableCompanion extends UpdateCompanion<IncomeTableData> {
  final Value<int> id;
  final Value<int> accountId;
  final Value<int> categoryId;
  final Value<String> date;
  final Value<String> time;
  final Value<int> amount;
  final Value<String> name;
  final Value<String> category;
  final Value<String> remark;
  final Value<String> paymentMode;
  final Value<String> lastEditedDate;
  final Value<String> lastEditedTime;
  final Value<String> imageUris;
  final Value<String> type;
  final Value<int> isHeader;
  final Value<int> isBookmarked;
  final Value<String?> fromAccount;
  final Value<String?> toAccount;
  final Value<String?> transferType;
  const IncomeTableCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
    this.amount = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.remark = const Value.absent(),
    this.paymentMode = const Value.absent(),
    this.lastEditedDate = const Value.absent(),
    this.lastEditedTime = const Value.absent(),
    this.imageUris = const Value.absent(),
    this.type = const Value.absent(),
    this.isHeader = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.fromAccount = const Value.absent(),
    this.toAccount = const Value.absent(),
    this.transferType = const Value.absent(),
  });
  IncomeTableCompanion.insert({
    this.id = const Value.absent(),
    required int accountId,
    required int categoryId,
    required String date,
    required String time,
    required int amount,
    required String name,
    required String category,
    required String remark,
    required String paymentMode,
    required String lastEditedDate,
    required String lastEditedTime,
    required String imageUris,
    required String type,
    required int isHeader,
    this.isBookmarked = const Value.absent(),
    this.fromAccount = const Value.absent(),
    this.toAccount = const Value.absent(),
    this.transferType = const Value.absent(),
  }) : accountId = Value(accountId),
       categoryId = Value(categoryId),
       date = Value(date),
       time = Value(time),
       amount = Value(amount),
       name = Value(name),
       category = Value(category),
       remark = Value(remark),
       paymentMode = Value(paymentMode),
       lastEditedDate = Value(lastEditedDate),
       lastEditedTime = Value(lastEditedTime),
       imageUris = Value(imageUris),
       type = Value(type),
       isHeader = Value(isHeader);
  static Insertable<IncomeTableData> custom({
    Expression<int>? id,
    Expression<int>? accountId,
    Expression<int>? categoryId,
    Expression<String>? date,
    Expression<String>? time,
    Expression<int>? amount,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? remark,
    Expression<String>? paymentMode,
    Expression<String>? lastEditedDate,
    Expression<String>? lastEditedTime,
    Expression<String>? imageUris,
    Expression<String>? type,
    Expression<int>? isHeader,
    Expression<int>? isBookmarked,
    Expression<String>? fromAccount,
    Expression<String>? toAccount,
    Expression<String>? transferType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'accountId': accountId,
      if (categoryId != null) 'categoryId': categoryId,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
      if (amount != null) 'amount': amount,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (remark != null) 'remark': remark,
      if (paymentMode != null) 'paymentMode': paymentMode,
      if (lastEditedDate != null) 'lastEditedDate': lastEditedDate,
      if (lastEditedTime != null) 'lastEditedTime': lastEditedTime,
      if (imageUris != null) 'imageUris': imageUris,
      if (type != null) 'type': type,
      if (isHeader != null) 'isHeader': isHeader,
      if (isBookmarked != null) 'isBookmarked': isBookmarked,
      if (fromAccount != null) 'fromAccount': fromAccount,
      if (toAccount != null) 'toAccount': toAccount,
      if (transferType != null) 'transferType': transferType,
    });
  }

  IncomeTableCompanion copyWith({
    Value<int>? id,
    Value<int>? accountId,
    Value<int>? categoryId,
    Value<String>? date,
    Value<String>? time,
    Value<int>? amount,
    Value<String>? name,
    Value<String>? category,
    Value<String>? remark,
    Value<String>? paymentMode,
    Value<String>? lastEditedDate,
    Value<String>? lastEditedTime,
    Value<String>? imageUris,
    Value<String>? type,
    Value<int>? isHeader,
    Value<int>? isBookmarked,
    Value<String?>? fromAccount,
    Value<String?>? toAccount,
    Value<String?>? transferType,
  }) {
    return IncomeTableCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      date: date ?? this.date,
      time: time ?? this.time,
      amount: amount ?? this.amount,
      name: name ?? this.name,
      category: category ?? this.category,
      remark: remark ?? this.remark,
      paymentMode: paymentMode ?? this.paymentMode,
      lastEditedDate: lastEditedDate ?? this.lastEditedDate,
      lastEditedTime: lastEditedTime ?? this.lastEditedTime,
      imageUris: imageUris ?? this.imageUris,
      type: type ?? this.type,
      isHeader: isHeader ?? this.isHeader,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      fromAccount: fromAccount ?? this.fromAccount,
      toAccount: toAccount ?? this.toAccount,
      transferType: transferType ?? this.transferType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountId.present) {
      map['accountId'] = Variable<int>(accountId.value);
    }
    if (categoryId.present) {
      map['categoryId'] = Variable<int>(categoryId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (paymentMode.present) {
      map['paymentMode'] = Variable<String>(paymentMode.value);
    }
    if (lastEditedDate.present) {
      map['lastEditedDate'] = Variable<String>(lastEditedDate.value);
    }
    if (lastEditedTime.present) {
      map['lastEditedTime'] = Variable<String>(lastEditedTime.value);
    }
    if (imageUris.present) {
      map['imageUris'] = Variable<String>(imageUris.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isHeader.present) {
      map['isHeader'] = Variable<int>(isHeader.value);
    }
    if (isBookmarked.present) {
      map['isBookmarked'] = Variable<int>(isBookmarked.value);
    }
    if (fromAccount.present) {
      map['fromAccount'] = Variable<String>(fromAccount.value);
    }
    if (toAccount.present) {
      map['toAccount'] = Variable<String>(toAccount.value);
    }
    if (transferType.present) {
      map['transferType'] = Variable<String>(transferType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeTableCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('amount: $amount, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('remark: $remark, ')
          ..write('paymentMode: $paymentMode, ')
          ..write('lastEditedDate: $lastEditedDate, ')
          ..write('lastEditedTime: $lastEditedTime, ')
          ..write('imageUris: $imageUris, ')
          ..write('type: $type, ')
          ..write('isHeader: $isHeader, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('fromAccount: $fromAccount, ')
          ..write('toAccount: $toAccount, ')
          ..write('transferType: $transferType')
          ..write(')'))
        .toString();
  }
}

class $RoomMasterTableTable extends RoomMasterTable
    with TableInfo<$RoomMasterTableTable, RoomMasterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomMasterTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _identityHashMeta = const VerificationMeta(
    'identityHash',
  );
  @override
  late final GeneratedColumn<String> identityHash = GeneratedColumn<String>(
    'identity_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, identityHash];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_master_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoomMasterTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('identity_hash')) {
      context.handle(
        _identityHashMeta,
        identityHash.isAcceptableOrUnknown(
          data['identity_hash']!,
          _identityHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_identityHashMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomMasterTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomMasterTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      identityHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}identity_hash'],
      )!,
    );
  }

  @override
  $RoomMasterTableTable createAlias(String alias) {
    return $RoomMasterTableTable(attachedDatabase, alias);
  }
}

class RoomMasterTableData extends DataClass
    implements Insertable<RoomMasterTableData> {
  final int id;
  final String identityHash;
  const RoomMasterTableData({required this.id, required this.identityHash});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['identity_hash'] = Variable<String>(identityHash);
    return map;
  }

  RoomMasterTableCompanion toCompanion(bool nullToAbsent) {
    return RoomMasterTableCompanion(
      id: Value(id),
      identityHash: Value(identityHash),
    );
  }

  factory RoomMasterTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomMasterTableData(
      id: serializer.fromJson<int>(json['id']),
      identityHash: serializer.fromJson<String>(json['identityHash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'identityHash': serializer.toJson<String>(identityHash),
    };
  }

  RoomMasterTableData copyWith({int? id, String? identityHash}) =>
      RoomMasterTableData(
        id: id ?? this.id,
        identityHash: identityHash ?? this.identityHash,
      );
  RoomMasterTableData copyWithCompanion(RoomMasterTableCompanion data) {
    return RoomMasterTableData(
      id: data.id.present ? data.id.value : this.id,
      identityHash: data.identityHash.present
          ? data.identityHash.value
          : this.identityHash,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomMasterTableData(')
          ..write('id: $id, ')
          ..write('identityHash: $identityHash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, identityHash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomMasterTableData &&
          other.id == this.id &&
          other.identityHash == this.identityHash);
}

class RoomMasterTableCompanion extends UpdateCompanion<RoomMasterTableData> {
  final Value<int> id;
  final Value<String> identityHash;
  const RoomMasterTableCompanion({
    this.id = const Value.absent(),
    this.identityHash = const Value.absent(),
  });
  RoomMasterTableCompanion.insert({
    this.id = const Value.absent(),
    required String identityHash,
  }) : identityHash = Value(identityHash);
  static Insertable<RoomMasterTableData> custom({
    Expression<int>? id,
    Expression<String>? identityHash,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (identityHash != null) 'identity_hash': identityHash,
    });
  }

  RoomMasterTableCompanion copyWith({
    Value<int>? id,
    Value<String>? identityHash,
  }) {
    return RoomMasterTableCompanion(
      id: id ?? this.id,
      identityHash: identityHash ?? this.identityHash,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (identityHash.present) {
      map['identity_hash'] = Variable<String>(identityHash.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomMasterTableCompanion(')
          ..write('id: $id, ')
          ..write('identityHash: $identityHash')
          ..write(')'))
        .toString();
  }
}

class $AndroidMetadataTable extends AndroidMetadata
    with TableInfo<$AndroidMetadataTable, AndroidMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AndroidMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localeMeta = const VerificationMeta('locale');
  @override
  late final GeneratedColumn<String> locale = GeneratedColumn<String>(
    'locale',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [locale];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'android_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<AndroidMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('locale')) {
      context.handle(
        _localeMeta,
        locale.isAcceptableOrUnknown(data['locale']!, _localeMeta),
      );
    } else if (isInserting) {
      context.missing(_localeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AndroidMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AndroidMetadataData(
      locale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locale'],
      )!,
    );
  }

  @override
  $AndroidMetadataTable createAlias(String alias) {
    return $AndroidMetadataTable(attachedDatabase, alias);
  }
}

class AndroidMetadataData extends DataClass
    implements Insertable<AndroidMetadataData> {
  final String locale;
  const AndroidMetadataData({required this.locale});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['locale'] = Variable<String>(locale);
    return map;
  }

  AndroidMetadataCompanion toCompanion(bool nullToAbsent) {
    return AndroidMetadataCompanion(locale: Value(locale));
  }

  factory AndroidMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AndroidMetadataData(
      locale: serializer.fromJson<String>(json['locale']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'locale': serializer.toJson<String>(locale)};
  }

  AndroidMetadataData copyWith({String? locale}) =>
      AndroidMetadataData(locale: locale ?? this.locale);
  AndroidMetadataData copyWithCompanion(AndroidMetadataCompanion data) {
    return AndroidMetadataData(
      locale: data.locale.present ? data.locale.value : this.locale,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AndroidMetadataData(')
          ..write('locale: $locale')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => locale.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AndroidMetadataData && other.locale == this.locale);
}

class AndroidMetadataCompanion extends UpdateCompanion<AndroidMetadataData> {
  final Value<String> locale;
  final Value<int> rowid;
  const AndroidMetadataCompanion({
    this.locale = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AndroidMetadataCompanion.insert({
    required String locale,
    this.rowid = const Value.absent(),
  }) : locale = Value(locale);
  static Insertable<AndroidMetadataData> custom({
    Expression<String>? locale,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (locale != null) 'locale': locale,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AndroidMetadataCompanion copyWith({
    Value<String>? locale,
    Value<int>? rowid,
  }) {
    return AndroidMetadataCompanion(
      locale: locale ?? this.locale,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (locale.present) {
      map['locale'] = Variable<String>(locale.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AndroidMetadataCompanion(')
          ..write('locale: $locale, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $PayModeTableTable payModeTable = $PayModeTableTable(this);
  late final $CurrencyDenominationsTable currencyDenominations =
      $CurrencyDenominationsTable(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final $SubCategoriesTable subCategories = $SubCategoriesTable(this);
  late final $AccountEntriesTable accountEntries = $AccountEntriesTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $IncomeTableTable incomeTable = $IncomeTableTable(this);
  late final $RoomMasterTableTable roomMasterTable = $RoomMasterTableTable(
    this,
  );
  late final $AndroidMetadataTable androidMetadata = $AndroidMetadataTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categoryTable,
    payModeTable,
    currencyDenominations,
    category,
    subCategories,
    accountEntries,
    reminders,
    incomeTable,
    roomMasterTable,
    androidMetadata,
  ];
}

typedef $$CategoryTableTableCreateCompanionBuilder =
    CategoryTableCompanion Function({
      Value<int> id,
      required String categoryName,
    });
typedef $$CategoryTableTableUpdateCompanionBuilder =
    CategoryTableCompanion Function({
      Value<int> id,
      Value<String> categoryName,
    });

class $$CategoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => column,
  );
}

class $$CategoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryTableTable,
          CategoryTableData,
          $$CategoryTableTableFilterComposer,
          $$CategoryTableTableOrderingComposer,
          $$CategoryTableTableAnnotationComposer,
          $$CategoryTableTableCreateCompanionBuilder,
          $$CategoryTableTableUpdateCompanionBuilder,
          (
            CategoryTableData,
            BaseReferences<
              _$AppDatabase,
              $CategoryTableTable,
              CategoryTableData
            >,
          ),
          CategoryTableData,
          PrefetchHooks Function()
        > {
  $$CategoryTableTableTableManager(_$AppDatabase db, $CategoryTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> categoryName = const Value.absent(),
              }) => CategoryTableCompanion(id: id, categoryName: categoryName),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String categoryName,
              }) => CategoryTableCompanion.insert(
                id: id,
                categoryName: categoryName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryTableTable,
      CategoryTableData,
      $$CategoryTableTableFilterComposer,
      $$CategoryTableTableOrderingComposer,
      $$CategoryTableTableAnnotationComposer,
      $$CategoryTableTableCreateCompanionBuilder,
      $$CategoryTableTableUpdateCompanionBuilder,
      (
        CategoryTableData,
        BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData>,
      ),
      CategoryTableData,
      PrefetchHooks Function()
    >;
typedef $$PayModeTableTableCreateCompanionBuilder =
    PayModeTableCompanion Function({
      Value<int> id,
      required String payModeName,
    });
typedef $$PayModeTableTableUpdateCompanionBuilder =
    PayModeTableCompanion Function({Value<int> id, Value<String> payModeName});

class $$PayModeTableTableFilterComposer
    extends Composer<_$AppDatabase, $PayModeTableTable> {
  $$PayModeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payModeName => $composableBuilder(
    column: $table.payModeName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PayModeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PayModeTableTable> {
  $$PayModeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payModeName => $composableBuilder(
    column: $table.payModeName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PayModeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PayModeTableTable> {
  $$PayModeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get payModeName => $composableBuilder(
    column: $table.payModeName,
    builder: (column) => column,
  );
}

class $$PayModeTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PayModeTableTable,
          PayModeTableData,
          $$PayModeTableTableFilterComposer,
          $$PayModeTableTableOrderingComposer,
          $$PayModeTableTableAnnotationComposer,
          $$PayModeTableTableCreateCompanionBuilder,
          $$PayModeTableTableUpdateCompanionBuilder,
          (
            PayModeTableData,
            BaseReferences<_$AppDatabase, $PayModeTableTable, PayModeTableData>,
          ),
          PayModeTableData,
          PrefetchHooks Function()
        > {
  $$PayModeTableTableTableManager(_$AppDatabase db, $PayModeTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PayModeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PayModeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PayModeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> payModeName = const Value.absent(),
              }) => PayModeTableCompanion(id: id, payModeName: payModeName),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String payModeName,
              }) => PayModeTableCompanion.insert(
                id: id,
                payModeName: payModeName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PayModeTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PayModeTableTable,
      PayModeTableData,
      $$PayModeTableTableFilterComposer,
      $$PayModeTableTableOrderingComposer,
      $$PayModeTableTableAnnotationComposer,
      $$PayModeTableTableCreateCompanionBuilder,
      $$PayModeTableTableUpdateCompanionBuilder,
      (
        PayModeTableData,
        BaseReferences<_$AppDatabase, $PayModeTableTable, PayModeTableData>,
      ),
      PayModeTableData,
      PrefetchHooks Function()
    >;
typedef $$CurrencyDenominationsTableCreateCompanionBuilder =
    CurrencyDenominationsCompanion Function({
      Value<int> id,
      required String countryCode,
      required double denominationValue,
      required int isEnabled,
    });
typedef $$CurrencyDenominationsTableUpdateCompanionBuilder =
    CurrencyDenominationsCompanion Function({
      Value<int> id,
      Value<String> countryCode,
      Value<double> denominationValue,
      Value<int> isEnabled,
    });

class $$CurrencyDenominationsTableFilterComposer
    extends Composer<_$AppDatabase, $CurrencyDenominationsTable> {
  $$CurrencyDenominationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get denominationValue => $composableBuilder(
    column: $table.denominationValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CurrencyDenominationsTableOrderingComposer
    extends Composer<_$AppDatabase, $CurrencyDenominationsTable> {
  $$CurrencyDenominationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get denominationValue => $composableBuilder(
    column: $table.denominationValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CurrencyDenominationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CurrencyDenominationsTable> {
  $$CurrencyDenominationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => column,
  );

  GeneratedColumn<double> get denominationValue => $composableBuilder(
    column: $table.denominationValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);
}

class $$CurrencyDenominationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CurrencyDenominationsTable,
          CurrencyDenomination,
          $$CurrencyDenominationsTableFilterComposer,
          $$CurrencyDenominationsTableOrderingComposer,
          $$CurrencyDenominationsTableAnnotationComposer,
          $$CurrencyDenominationsTableCreateCompanionBuilder,
          $$CurrencyDenominationsTableUpdateCompanionBuilder,
          (
            CurrencyDenomination,
            BaseReferences<
              _$AppDatabase,
              $CurrencyDenominationsTable,
              CurrencyDenomination
            >,
          ),
          CurrencyDenomination,
          PrefetchHooks Function()
        > {
  $$CurrencyDenominationsTableTableManager(
    _$AppDatabase db,
    $CurrencyDenominationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CurrencyDenominationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CurrencyDenominationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CurrencyDenominationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> countryCode = const Value.absent(),
                Value<double> denominationValue = const Value.absent(),
                Value<int> isEnabled = const Value.absent(),
              }) => CurrencyDenominationsCompanion(
                id: id,
                countryCode: countryCode,
                denominationValue: denominationValue,
                isEnabled: isEnabled,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String countryCode,
                required double denominationValue,
                required int isEnabled,
              }) => CurrencyDenominationsCompanion.insert(
                id: id,
                countryCode: countryCode,
                denominationValue: denominationValue,
                isEnabled: isEnabled,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CurrencyDenominationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CurrencyDenominationsTable,
      CurrencyDenomination,
      $$CurrencyDenominationsTableFilterComposer,
      $$CurrencyDenominationsTableOrderingComposer,
      $$CurrencyDenominationsTableAnnotationComposer,
      $$CurrencyDenominationsTableCreateCompanionBuilder,
      $$CurrencyDenominationsTableUpdateCompanionBuilder,
      (
        CurrencyDenomination,
        BaseReferences<
          _$AppDatabase,
          $CurrencyDenominationsTable,
          CurrencyDenomination
        >,
      ),
      CurrencyDenomination,
      PrefetchHooks Function()
    >;
typedef $$CategoryTableCreateCompanionBuilder =
    CategoryCompanion Function({Value<int> id, required String name});
typedef $$CategoryTableUpdateCompanionBuilder =
    CategoryCompanion Function({Value<int> id, Value<String> name});

class $$CategoryTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoryTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$CategoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryTable,
          CategoryData,
          $$CategoryTableFilterComposer,
          $$CategoryTableOrderingComposer,
          $$CategoryTableAnnotationComposer,
          $$CategoryTableCreateCompanionBuilder,
          $$CategoryTableUpdateCompanionBuilder,
          (
            CategoryData,
            BaseReferences<_$AppDatabase, $CategoryTable, CategoryData>,
          ),
          CategoryData,
          PrefetchHooks Function()
        > {
  $$CategoryTableTableManager(_$AppDatabase db, $CategoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => CategoryCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  CategoryCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryTable,
      CategoryData,
      $$CategoryTableFilterComposer,
      $$CategoryTableOrderingComposer,
      $$CategoryTableAnnotationComposer,
      $$CategoryTableCreateCompanionBuilder,
      $$CategoryTableUpdateCompanionBuilder,
      (
        CategoryData,
        BaseReferences<_$AppDatabase, $CategoryTable, CategoryData>,
      ),
      CategoryData,
      PrefetchHooks Function()
    >;
typedef $$SubCategoriesTableCreateCompanionBuilder =
    SubCategoriesCompanion Function({
      Value<int> id,
      required int mainCategoryId,
      required String name,
      required int position,
    });
typedef $$SubCategoriesTableUpdateCompanionBuilder =
    SubCategoriesCompanion Function({
      Value<int> id,
      Value<int> mainCategoryId,
      Value<String> name,
      Value<int> position,
    });

class $$SubCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $SubCategoriesTable> {
  $$SubCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainCategoryId => $composableBuilder(
    column: $table.mainCategoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SubCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SubCategoriesTable> {
  $$SubCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainCategoryId => $composableBuilder(
    column: $table.mainCategoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubCategoriesTable> {
  $$SubCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get mainCategoryId => $composableBuilder(
    column: $table.mainCategoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);
}

class $$SubCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubCategoriesTable,
          SubCategory,
          $$SubCategoriesTableFilterComposer,
          $$SubCategoriesTableOrderingComposer,
          $$SubCategoriesTableAnnotationComposer,
          $$SubCategoriesTableCreateCompanionBuilder,
          $$SubCategoriesTableUpdateCompanionBuilder,
          (
            SubCategory,
            BaseReferences<_$AppDatabase, $SubCategoriesTable, SubCategory>,
          ),
          SubCategory,
          PrefetchHooks Function()
        > {
  $$SubCategoriesTableTableManager(_$AppDatabase db, $SubCategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> mainCategoryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> position = const Value.absent(),
              }) => SubCategoriesCompanion(
                id: id,
                mainCategoryId: mainCategoryId,
                name: name,
                position: position,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int mainCategoryId,
                required String name,
                required int position,
              }) => SubCategoriesCompanion.insert(
                id: id,
                mainCategoryId: mainCategoryId,
                name: name,
                position: position,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SubCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubCategoriesTable,
      SubCategory,
      $$SubCategoriesTableFilterComposer,
      $$SubCategoriesTableOrderingComposer,
      $$SubCategoriesTableAnnotationComposer,
      $$SubCategoriesTableCreateCompanionBuilder,
      $$SubCategoriesTableUpdateCompanionBuilder,
      (
        SubCategory,
        BaseReferences<_$AppDatabase, $SubCategoriesTable, SubCategory>,
      ),
      SubCategory,
      PrefetchHooks Function()
    >;
typedef $$AccountEntriesTableCreateCompanionBuilder =
    AccountEntriesCompanion Function({
      Value<int> id,
      required String entryName,
      required String entryDateTime,
    });
typedef $$AccountEntriesTableUpdateCompanionBuilder =
    AccountEntriesCompanion Function({
      Value<int> id,
      Value<String> entryName,
      Value<String> entryDateTime,
    });

class $$AccountEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $AccountEntriesTable> {
  $$AccountEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entryName => $composableBuilder(
    column: $table.entryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entryDateTime => $composableBuilder(
    column: $table.entryDateTime,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AccountEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountEntriesTable> {
  $$AccountEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entryName => $composableBuilder(
    column: $table.entryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entryDateTime => $composableBuilder(
    column: $table.entryDateTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccountEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountEntriesTable> {
  $$AccountEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entryName =>
      $composableBuilder(column: $table.entryName, builder: (column) => column);

  GeneratedColumn<String> get entryDateTime => $composableBuilder(
    column: $table.entryDateTime,
    builder: (column) => column,
  );
}

class $$AccountEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountEntriesTable,
          AccountEntry,
          $$AccountEntriesTableFilterComposer,
          $$AccountEntriesTableOrderingComposer,
          $$AccountEntriesTableAnnotationComposer,
          $$AccountEntriesTableCreateCompanionBuilder,
          $$AccountEntriesTableUpdateCompanionBuilder,
          (
            AccountEntry,
            BaseReferences<_$AppDatabase, $AccountEntriesTable, AccountEntry>,
          ),
          AccountEntry,
          PrefetchHooks Function()
        > {
  $$AccountEntriesTableTableManager(
    _$AppDatabase db,
    $AccountEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entryName = const Value.absent(),
                Value<String> entryDateTime = const Value.absent(),
              }) => AccountEntriesCompanion(
                id: id,
                entryName: entryName,
                entryDateTime: entryDateTime,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entryName,
                required String entryDateTime,
              }) => AccountEntriesCompanion.insert(
                id: id,
                entryName: entryName,
                entryDateTime: entryDateTime,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AccountEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountEntriesTable,
      AccountEntry,
      $$AccountEntriesTableFilterComposer,
      $$AccountEntriesTableOrderingComposer,
      $$AccountEntriesTableAnnotationComposer,
      $$AccountEntriesTableCreateCompanionBuilder,
      $$AccountEntriesTableUpdateCompanionBuilder,
      (
        AccountEntry,
        BaseReferences<_$AppDatabase, $AccountEntriesTable, AccountEntry>,
      ),
      AccountEntry,
      PrefetchHooks Function()
    >;
typedef $$RemindersTableCreateCompanionBuilder =
    RemindersCompanion Function({
      required String id,
      required String name,
      required String frequency,
      required String date,
      required String time,
      required String note,
      required int isActive,
      Value<int> rowid,
    });
typedef $$RemindersTableUpdateCompanionBuilder =
    RemindersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> frequency,
      Value<String> date,
      Value<String> time,
      Value<String> note,
      Value<int> isActive,
      Value<int> rowid,
    });

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          Reminder,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (Reminder, BaseReferences<_$AppDatabase, $RemindersTable, Reminder>),
          Reminder,
          PrefetchHooks Function()
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> time = const Value.absent(),
                Value<String> note = const Value.absent(),
                Value<int> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                name: name,
                frequency: frequency,
                date: date,
                time: time,
                note: note,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String frequency,
                required String date,
                required String time,
                required String note,
                required int isActive,
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                name: name,
                frequency: frequency,
                date: date,
                time: time,
                note: note,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      Reminder,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (Reminder, BaseReferences<_$AppDatabase, $RemindersTable, Reminder>),
      Reminder,
      PrefetchHooks Function()
    >;
typedef $$IncomeTableTableCreateCompanionBuilder =
    IncomeTableCompanion Function({
      Value<int> id,
      required int accountId,
      required int categoryId,
      required String date,
      required String time,
      required int amount,
      required String name,
      required String category,
      required String remark,
      required String paymentMode,
      required String lastEditedDate,
      required String lastEditedTime,
      required String imageUris,
      required String type,
      required int isHeader,
      Value<int> isBookmarked,
      Value<String?> fromAccount,
      Value<String?> toAccount,
      Value<String?> transferType,
    });
typedef $$IncomeTableTableUpdateCompanionBuilder =
    IncomeTableCompanion Function({
      Value<int> id,
      Value<int> accountId,
      Value<int> categoryId,
      Value<String> date,
      Value<String> time,
      Value<int> amount,
      Value<String> name,
      Value<String> category,
      Value<String> remark,
      Value<String> paymentMode,
      Value<String> lastEditedDate,
      Value<String> lastEditedTime,
      Value<String> imageUris,
      Value<String> type,
      Value<int> isHeader,
      Value<int> isBookmarked,
      Value<String?> fromAccount,
      Value<String?> toAccount,
      Value<String?> transferType,
    });

class $$IncomeTableTableFilterComposer
    extends Composer<_$AppDatabase, $IncomeTableTable> {
  $$IncomeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMode => $composableBuilder(
    column: $table.paymentMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedDate => $composableBuilder(
    column: $table.lastEditedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedTime => $composableBuilder(
    column: $table.lastEditedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUris => $composableBuilder(
    column: $table.imageUris,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isHeader => $composableBuilder(
    column: $table.isHeader,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fromAccount => $composableBuilder(
    column: $table.fromAccount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toAccount => $composableBuilder(
    column: $table.toAccount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transferType => $composableBuilder(
    column: $table.transferType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$IncomeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomeTableTable> {
  $$IncomeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMode => $composableBuilder(
    column: $table.paymentMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedDate => $composableBuilder(
    column: $table.lastEditedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedTime => $composableBuilder(
    column: $table.lastEditedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUris => $composableBuilder(
    column: $table.imageUris,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isHeader => $composableBuilder(
    column: $table.isHeader,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fromAccount => $composableBuilder(
    column: $table.fromAccount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toAccount => $composableBuilder(
    column: $table.toAccount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transferType => $composableBuilder(
    column: $table.transferType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IncomeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomeTableTable> {
  $$IncomeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get paymentMode => $composableBuilder(
    column: $table.paymentMode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastEditedDate => $composableBuilder(
    column: $table.lastEditedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastEditedTime => $composableBuilder(
    column: $table.lastEditedTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUris =>
      $composableBuilder(column: $table.imageUris, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get isHeader =>
      $composableBuilder(column: $table.isHeader, builder: (column) => column);

  GeneratedColumn<int> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fromAccount => $composableBuilder(
    column: $table.fromAccount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get toAccount =>
      $composableBuilder(column: $table.toAccount, builder: (column) => column);

  GeneratedColumn<String> get transferType => $composableBuilder(
    column: $table.transferType,
    builder: (column) => column,
  );
}

class $$IncomeTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IncomeTableTable,
          IncomeTableData,
          $$IncomeTableTableFilterComposer,
          $$IncomeTableTableOrderingComposer,
          $$IncomeTableTableAnnotationComposer,
          $$IncomeTableTableCreateCompanionBuilder,
          $$IncomeTableTableUpdateCompanionBuilder,
          (
            IncomeTableData,
            BaseReferences<_$AppDatabase, $IncomeTableTable, IncomeTableData>,
          ),
          IncomeTableData,
          PrefetchHooks Function()
        > {
  $$IncomeTableTableTableManager(_$AppDatabase db, $IncomeTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> time = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> remark = const Value.absent(),
                Value<String> paymentMode = const Value.absent(),
                Value<String> lastEditedDate = const Value.absent(),
                Value<String> lastEditedTime = const Value.absent(),
                Value<String> imageUris = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> isHeader = const Value.absent(),
                Value<int> isBookmarked = const Value.absent(),
                Value<String?> fromAccount = const Value.absent(),
                Value<String?> toAccount = const Value.absent(),
                Value<String?> transferType = const Value.absent(),
              }) => IncomeTableCompanion(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                date: date,
                time: time,
                amount: amount,
                name: name,
                category: category,
                remark: remark,
                paymentMode: paymentMode,
                lastEditedDate: lastEditedDate,
                lastEditedTime: lastEditedTime,
                imageUris: imageUris,
                type: type,
                isHeader: isHeader,
                isBookmarked: isBookmarked,
                fromAccount: fromAccount,
                toAccount: toAccount,
                transferType: transferType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int accountId,
                required int categoryId,
                required String date,
                required String time,
                required int amount,
                required String name,
                required String category,
                required String remark,
                required String paymentMode,
                required String lastEditedDate,
                required String lastEditedTime,
                required String imageUris,
                required String type,
                required int isHeader,
                Value<int> isBookmarked = const Value.absent(),
                Value<String?> fromAccount = const Value.absent(),
                Value<String?> toAccount = const Value.absent(),
                Value<String?> transferType = const Value.absent(),
              }) => IncomeTableCompanion.insert(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                date: date,
                time: time,
                amount: amount,
                name: name,
                category: category,
                remark: remark,
                paymentMode: paymentMode,
                lastEditedDate: lastEditedDate,
                lastEditedTime: lastEditedTime,
                imageUris: imageUris,
                type: type,
                isHeader: isHeader,
                isBookmarked: isBookmarked,
                fromAccount: fromAccount,
                toAccount: toAccount,
                transferType: transferType,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$IncomeTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IncomeTableTable,
      IncomeTableData,
      $$IncomeTableTableFilterComposer,
      $$IncomeTableTableOrderingComposer,
      $$IncomeTableTableAnnotationComposer,
      $$IncomeTableTableCreateCompanionBuilder,
      $$IncomeTableTableUpdateCompanionBuilder,
      (
        IncomeTableData,
        BaseReferences<_$AppDatabase, $IncomeTableTable, IncomeTableData>,
      ),
      IncomeTableData,
      PrefetchHooks Function()
    >;
typedef $$RoomMasterTableTableCreateCompanionBuilder =
    RoomMasterTableCompanion Function({
      Value<int> id,
      required String identityHash,
    });
typedef $$RoomMasterTableTableUpdateCompanionBuilder =
    RoomMasterTableCompanion Function({
      Value<int> id,
      Value<String> identityHash,
    });

class $$RoomMasterTableTableFilterComposer
    extends Composer<_$AppDatabase, $RoomMasterTableTable> {
  $$RoomMasterTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get identityHash => $composableBuilder(
    column: $table.identityHash,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoomMasterTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomMasterTableTable> {
  $$RoomMasterTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get identityHash => $composableBuilder(
    column: $table.identityHash,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoomMasterTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomMasterTableTable> {
  $$RoomMasterTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get identityHash => $composableBuilder(
    column: $table.identityHash,
    builder: (column) => column,
  );
}

class $$RoomMasterTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoomMasterTableTable,
          RoomMasterTableData,
          $$RoomMasterTableTableFilterComposer,
          $$RoomMasterTableTableOrderingComposer,
          $$RoomMasterTableTableAnnotationComposer,
          $$RoomMasterTableTableCreateCompanionBuilder,
          $$RoomMasterTableTableUpdateCompanionBuilder,
          (
            RoomMasterTableData,
            BaseReferences<
              _$AppDatabase,
              $RoomMasterTableTable,
              RoomMasterTableData
            >,
          ),
          RoomMasterTableData,
          PrefetchHooks Function()
        > {
  $$RoomMasterTableTableTableManager(
    _$AppDatabase db,
    $RoomMasterTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomMasterTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomMasterTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomMasterTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> identityHash = const Value.absent(),
              }) =>
                  RoomMasterTableCompanion(id: id, identityHash: identityHash),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String identityHash,
              }) => RoomMasterTableCompanion.insert(
                id: id,
                identityHash: identityHash,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoomMasterTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoomMasterTableTable,
      RoomMasterTableData,
      $$RoomMasterTableTableFilterComposer,
      $$RoomMasterTableTableOrderingComposer,
      $$RoomMasterTableTableAnnotationComposer,
      $$RoomMasterTableTableCreateCompanionBuilder,
      $$RoomMasterTableTableUpdateCompanionBuilder,
      (
        RoomMasterTableData,
        BaseReferences<
          _$AppDatabase,
          $RoomMasterTableTable,
          RoomMasterTableData
        >,
      ),
      RoomMasterTableData,
      PrefetchHooks Function()
    >;
typedef $$AndroidMetadataTableCreateCompanionBuilder =
    AndroidMetadataCompanion Function({
      required String locale,
      Value<int> rowid,
    });
typedef $$AndroidMetadataTableUpdateCompanionBuilder =
    AndroidMetadataCompanion Function({Value<String> locale, Value<int> rowid});

class $$AndroidMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $AndroidMetadataTable> {
  $$AndroidMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get locale => $composableBuilder(
    column: $table.locale,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AndroidMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $AndroidMetadataTable> {
  $$AndroidMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get locale => $composableBuilder(
    column: $table.locale,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AndroidMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $AndroidMetadataTable> {
  $$AndroidMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get locale =>
      $composableBuilder(column: $table.locale, builder: (column) => column);
}

class $$AndroidMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AndroidMetadataTable,
          AndroidMetadataData,
          $$AndroidMetadataTableFilterComposer,
          $$AndroidMetadataTableOrderingComposer,
          $$AndroidMetadataTableAnnotationComposer,
          $$AndroidMetadataTableCreateCompanionBuilder,
          $$AndroidMetadataTableUpdateCompanionBuilder,
          (
            AndroidMetadataData,
            BaseReferences<
              _$AppDatabase,
              $AndroidMetadataTable,
              AndroidMetadataData
            >,
          ),
          AndroidMetadataData,
          PrefetchHooks Function()
        > {
  $$AndroidMetadataTableTableManager(
    _$AppDatabase db,
    $AndroidMetadataTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AndroidMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AndroidMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AndroidMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> locale = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AndroidMetadataCompanion(locale: locale, rowid: rowid),
          createCompanionCallback:
              ({
                required String locale,
                Value<int> rowid = const Value.absent(),
              }) =>
                  AndroidMetadataCompanion.insert(locale: locale, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AndroidMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AndroidMetadataTable,
      AndroidMetadataData,
      $$AndroidMetadataTableFilterComposer,
      $$AndroidMetadataTableOrderingComposer,
      $$AndroidMetadataTableAnnotationComposer,
      $$AndroidMetadataTableCreateCompanionBuilder,
      $$AndroidMetadataTableUpdateCompanionBuilder,
      (
        AndroidMetadataData,
        BaseReferences<
          _$AppDatabase,
          $AndroidMetadataTable,
          AndroidMetadataData
        >,
      ),
      AndroidMetadataData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);
  $$PayModeTableTableTableManager get payModeTable =>
      $$PayModeTableTableTableManager(_db, _db.payModeTable);
  $$CurrencyDenominationsTableTableManager get currencyDenominations =>
      $$CurrencyDenominationsTableTableManager(_db, _db.currencyDenominations);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
  $$SubCategoriesTableTableManager get subCategories =>
      $$SubCategoriesTableTableManager(_db, _db.subCategories);
  $$AccountEntriesTableTableManager get accountEntries =>
      $$AccountEntriesTableTableManager(_db, _db.accountEntries);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$IncomeTableTableTableManager get incomeTable =>
      $$IncomeTableTableTableManager(_db, _db.incomeTable);
  $$RoomMasterTableTableTableManager get roomMasterTable =>
      $$RoomMasterTableTableTableManager(_db, _db.roomMasterTable);
  $$AndroidMetadataTableTableManager get androidMetadata =>
      $$AndroidMetadataTableTableManager(_db, _db.androidMetadata);
}
