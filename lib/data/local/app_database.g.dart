// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Commodity extends DataClass implements Insertable<Commodity> {
  final int id;
  final String name;
  final String description;
  final double price;
  final String code;
  final int status;
  final DateTime createdAt;
  Commodity(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.price,
      @required this.code,
      @required this.status,
      @required this.createdAt});
  factory Commodity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Commodity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      price:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  CommoditysCompanion toCompanion(bool nullToAbsent) {
    return CommoditysCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Commodity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Commodity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      price: serializer.fromJson<double>(json['price']),
      code: serializer.fromJson<String>(json['code']),
      status: serializer.fromJson<int>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'price': serializer.toJson<double>(price),
      'code': serializer.toJson<String>(code),
      'status': serializer.toJson<int>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Commodity copyWith(
          {int id,
          String name,
          String description,
          double price,
          String code,
          int status,
          DateTime createdAt}) =>
      Commodity(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        code: code ?? this.code,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Commodity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('code: $code, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  price.hashCode,
                  $mrjc(code.hashCode,
                      $mrjc(status.hashCode, createdAt.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Commodity &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.price == this.price &&
          other.code == this.code &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class CommoditysCompanion extends UpdateCompanion<Commodity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<double> price;
  final Value<String> code;
  final Value<int> status;
  final Value<DateTime> createdAt;
  const CommoditysCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.code = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CommoditysCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String description,
    this.price = const Value.absent(),
    @required String code,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        description = Value(description),
        code = Value(code);
  static Insertable<Commodity> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> description,
    Expression<double> price,
    Expression<String> code,
    Expression<int> status,
    Expression<DateTime> createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (code != null) 'code': code,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CommoditysCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<double> price,
      Value<String> code,
      Value<int> status,
      Value<DateTime> createdAt}) {
    return CommoditysCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      code: code ?? this.code,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommoditysCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('code: $code, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CommoditysTable extends Commoditys
    with TableInfo<$CommoditysTable, Commodity> {
  final GeneratedDatabase _db;
  final String _alias;
  $CommoditysTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedRealColumn _price;
  @override
  GeneratedRealColumn get price => _price ??= _constructPrice();
  GeneratedRealColumn _constructPrice() {
    return GeneratedRealColumn('price', $tableName, false,
        defaultValue: const Constant(0.0));
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn('code', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn('status', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn('created_at', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, price, code, status, createdAt];
  @override
  $CommoditysTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'commoditys';
  @override
  final String actualTableName = 'commoditys';
  @override
  VerificationContext validateIntegrity(Insertable<Commodity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Commodity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Commodity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CommoditysTable createAlias(String alias) {
    return $CommoditysTable(_db, alias);
  }
}

class Deposit extends DataClass implements Insertable<Deposit> {
  final int id;
  final String code;
  final int amount;
  final int status;
  final DateTime depositAt;
  Deposit(
      {@required this.id,
      @required this.code,
      @required this.amount,
      @required this.status,
      @required this.depositAt});
  factory Deposit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Deposit(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      amount: intType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      depositAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deposit_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<int>(amount);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || depositAt != null) {
      map['deposit_at'] = Variable<DateTime>(depositAt);
    }
    return map;
  }

  DepositsCompanion toCompanion(bool nullToAbsent) {
    return DepositsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      depositAt: depositAt == null && nullToAbsent
          ? const Value.absent()
          : Value(depositAt),
    );
  }

  factory Deposit.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Deposit(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      amount: serializer.fromJson<int>(json['amount']),
      status: serializer.fromJson<int>(json['status']),
      depositAt: serializer.fromJson<DateTime>(json['depositAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'amount': serializer.toJson<int>(amount),
      'status': serializer.toJson<int>(status),
      'depositAt': serializer.toJson<DateTime>(depositAt),
    };
  }

  Deposit copyWith(
          {int id, String code, int amount, int status, DateTime depositAt}) =>
      Deposit(
        id: id ?? this.id,
        code: code ?? this.code,
        amount: amount ?? this.amount,
        status: status ?? this.status,
        depositAt: depositAt ?? this.depositAt,
      );
  @override
  String toString() {
    return (StringBuffer('Deposit(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('amount: $amount, ')
          ..write('status: $status, ')
          ..write('depositAt: $depositAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(code.hashCode,
          $mrjc(amount.hashCode, $mrjc(status.hashCode, depositAt.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Deposit &&
          other.id == this.id &&
          other.code == this.code &&
          other.amount == this.amount &&
          other.status == this.status &&
          other.depositAt == this.depositAt);
}

class DepositsCompanion extends UpdateCompanion<Deposit> {
  final Value<int> id;
  final Value<String> code;
  final Value<int> amount;
  final Value<int> status;
  final Value<DateTime> depositAt;
  const DepositsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.amount = const Value.absent(),
    this.status = const Value.absent(),
    this.depositAt = const Value.absent(),
  });
  DepositsCompanion.insert({
    this.id = const Value.absent(),
    @required String code,
    @required int amount,
    this.status = const Value.absent(),
    this.depositAt = const Value.absent(),
  })  : code = Value(code),
        amount = Value(amount);
  static Insertable<Deposit> custom({
    Expression<int> id,
    Expression<String> code,
    Expression<int> amount,
    Expression<int> status,
    Expression<DateTime> depositAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (amount != null) 'amount': amount,
      if (status != null) 'status': status,
      if (depositAt != null) 'deposit_at': depositAt,
    });
  }

  DepositsCompanion copyWith(
      {Value<int> id,
      Value<String> code,
      Value<int> amount,
      Value<int> status,
      Value<DateTime> depositAt}) {
    return DepositsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      depositAt: depositAt ?? this.depositAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (depositAt.present) {
      map['deposit_at'] = Variable<DateTime>(depositAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepositsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('amount: $amount, ')
          ..write('status: $status, ')
          ..write('depositAt: $depositAt')
          ..write(')'))
        .toString();
  }
}

class $DepositsTable extends Deposits with TableInfo<$DepositsTable, Deposit> {
  final GeneratedDatabase _db;
  final String _alias;
  $DepositsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn('code', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedIntColumn _amount;
  @override
  GeneratedIntColumn get amount => _amount ??= _constructAmount();
  GeneratedIntColumn _constructAmount() {
    return GeneratedIntColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn('status', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _depositAtMeta = const VerificationMeta('depositAt');
  GeneratedDateTimeColumn _depositAt;
  @override
  GeneratedDateTimeColumn get depositAt => _depositAt ??= _constructDepositAt();
  GeneratedDateTimeColumn _constructDepositAt() {
    return GeneratedDateTimeColumn('deposit_at', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns => [id, code, amount, status, depositAt];
  @override
  $DepositsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'deposits';
  @override
  final String actualTableName = 'deposits';
  @override
  VerificationContext validateIntegrity(Insertable<Deposit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    if (data.containsKey('deposit_at')) {
      context.handle(_depositAtMeta,
          depositAt.isAcceptableOrUnknown(data['deposit_at'], _depositAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Deposit map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Deposit.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DepositsTable createAlias(String alias) {
    return $DepositsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CommoditysTable _commoditys;
  $CommoditysTable get commoditys => _commoditys ??= $CommoditysTable(this);
  $DepositsTable _deposits;
  $DepositsTable get deposits => _deposits ??= $DepositsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [commoditys, deposits];
}
