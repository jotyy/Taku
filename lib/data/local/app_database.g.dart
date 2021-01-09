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

  CommoditiesCompanion toCompanion(bool nullToAbsent) {
    return CommoditiesCompanion(
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

class CommoditiesCompanion extends UpdateCompanion<Commodity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<double> price;
  final Value<String> code;
  final Value<int> status;
  final Value<DateTime> createdAt;
  const CommoditiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.code = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CommoditiesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String description,
    this.price = const Value.absent(),
    @required String code,
    this.status = const Value.absent(),
    @required DateTime createdAt,
  })  : name = Value(name),
        description = Value(description),
        code = Value(code),
        createdAt = Value(createdAt);
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

  CommoditiesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<double> price,
      Value<String> code,
      Value<int> status,
      Value<DateTime> createdAt}) {
    return CommoditiesCompanion(
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
    return (StringBuffer('CommoditiesCompanion(')
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

class $CommoditiesTable extends Commodities
    with TableInfo<$CommoditiesTable, Commodity> {
  final GeneratedDatabase _db;
  final String _alias;
  $CommoditiesTable(this._db, [this._alias]);
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
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, price, code, status, createdAt];
  @override
  $CommoditiesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'commodities';
  @override
  final String actualTableName = 'commodities';
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
    } else if (isInserting) {
      context.missing(_createdAtMeta);
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
  $CommoditiesTable createAlias(String alias) {
    return $CommoditiesTable(_db, alias);
  }
}

class Record extends DataClass implements Insertable<Record> {
  final int id;
  final String code;
  final int amount;
  final int status;
  final String uuid;
  final String wdUuid;
  final DateTime depositAt;
  final DateTime withdrawAt;
  Record(
      {@required this.id,
      @required this.code,
      @required this.amount,
      @required this.status,
      @required this.uuid,
      @required this.wdUuid,
      @required this.depositAt,
      @required this.withdrawAt});
  factory Record.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Record(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      amount: intType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      uuid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uuid']),
      wdUuid:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}wd_uuid']),
      depositAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deposit_at']),
      withdrawAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}withdraw_at']),
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
    if (!nullToAbsent || uuid != null) {
      map['uuid'] = Variable<String>(uuid);
    }
    if (!nullToAbsent || wdUuid != null) {
      map['wd_uuid'] = Variable<String>(wdUuid);
    }
    if (!nullToAbsent || depositAt != null) {
      map['deposit_at'] = Variable<DateTime>(depositAt);
    }
    if (!nullToAbsent || withdrawAt != null) {
      map['withdraw_at'] = Variable<DateTime>(withdrawAt);
    }
    return map;
  }

  RecordsCompanion toCompanion(bool nullToAbsent) {
    return RecordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      uuid: uuid == null && nullToAbsent ? const Value.absent() : Value(uuid),
      wdUuid:
          wdUuid == null && nullToAbsent ? const Value.absent() : Value(wdUuid),
      depositAt: depositAt == null && nullToAbsent
          ? const Value.absent()
          : Value(depositAt),
      withdrawAt: withdrawAt == null && nullToAbsent
          ? const Value.absent()
          : Value(withdrawAt),
    );
  }

  factory Record.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Record(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      amount: serializer.fromJson<int>(json['amount']),
      status: serializer.fromJson<int>(json['status']),
      uuid: serializer.fromJson<String>(json['uuid']),
      wdUuid: serializer.fromJson<String>(json['wdUuid']),
      depositAt: serializer.fromJson<DateTime>(json['depositAt']),
      withdrawAt: serializer.fromJson<DateTime>(json['withdrawAt']),
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
      'uuid': serializer.toJson<String>(uuid),
      'wdUuid': serializer.toJson<String>(wdUuid),
      'depositAt': serializer.toJson<DateTime>(depositAt),
      'withdrawAt': serializer.toJson<DateTime>(withdrawAt),
    };
  }

  Record copyWith(
          {int id,
          String code,
          int amount,
          int status,
          String uuid,
          String wdUuid,
          DateTime depositAt,
          DateTime withdrawAt}) =>
      Record(
        id: id ?? this.id,
        code: code ?? this.code,
        amount: amount ?? this.amount,
        status: status ?? this.status,
        uuid: uuid ?? this.uuid,
        wdUuid: wdUuid ?? this.wdUuid,
        depositAt: depositAt ?? this.depositAt,
        withdrawAt: withdrawAt ?? this.withdrawAt,
      );
  @override
  String toString() {
    return (StringBuffer('Record(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('amount: $amount, ')
          ..write('status: $status, ')
          ..write('uuid: $uuid, ')
          ..write('wdUuid: $wdUuid, ')
          ..write('depositAt: $depositAt, ')
          ..write('withdrawAt: $withdrawAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          code.hashCode,
          $mrjc(
              amount.hashCode,
              $mrjc(
                  status.hashCode,
                  $mrjc(
                      uuid.hashCode,
                      $mrjc(wdUuid.hashCode,
                          $mrjc(depositAt.hashCode, withdrawAt.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Record &&
          other.id == this.id &&
          other.code == this.code &&
          other.amount == this.amount &&
          other.status == this.status &&
          other.uuid == this.uuid &&
          other.wdUuid == this.wdUuid &&
          other.depositAt == this.depositAt &&
          other.withdrawAt == this.withdrawAt);
}

class RecordsCompanion extends UpdateCompanion<Record> {
  final Value<int> id;
  final Value<String> code;
  final Value<int> amount;
  final Value<int> status;
  final Value<String> uuid;
  final Value<String> wdUuid;
  final Value<DateTime> depositAt;
  final Value<DateTime> withdrawAt;
  const RecordsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.amount = const Value.absent(),
    this.status = const Value.absent(),
    this.uuid = const Value.absent(),
    this.wdUuid = const Value.absent(),
    this.depositAt = const Value.absent(),
    this.withdrawAt = const Value.absent(),
  });
  RecordsCompanion.insert({
    this.id = const Value.absent(),
    @required String code,
    @required int amount,
    this.status = const Value.absent(),
    @required String uuid,
    @required String wdUuid,
    @required DateTime depositAt,
    @required DateTime withdrawAt,
  })  : code = Value(code),
        amount = Value(amount),
        uuid = Value(uuid),
        wdUuid = Value(wdUuid),
        depositAt = Value(depositAt),
        withdrawAt = Value(withdrawAt);
  static Insertable<Record> custom({
    Expression<int> id,
    Expression<String> code,
    Expression<int> amount,
    Expression<int> status,
    Expression<String> uuid,
    Expression<String> wdUuid,
    Expression<DateTime> depositAt,
    Expression<DateTime> withdrawAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (amount != null) 'amount': amount,
      if (status != null) 'status': status,
      if (uuid != null) 'uuid': uuid,
      if (wdUuid != null) 'wd_uuid': wdUuid,
      if (depositAt != null) 'deposit_at': depositAt,
      if (withdrawAt != null) 'withdraw_at': withdrawAt,
    });
  }

  RecordsCompanion copyWith(
      {Value<int> id,
      Value<String> code,
      Value<int> amount,
      Value<int> status,
      Value<String> uuid,
      Value<String> wdUuid,
      Value<DateTime> depositAt,
      Value<DateTime> withdrawAt}) {
    return RecordsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      uuid: uuid ?? this.uuid,
      wdUuid: wdUuid ?? this.wdUuid,
      depositAt: depositAt ?? this.depositAt,
      withdrawAt: withdrawAt ?? this.withdrawAt,
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
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (wdUuid.present) {
      map['wd_uuid'] = Variable<String>(wdUuid.value);
    }
    if (depositAt.present) {
      map['deposit_at'] = Variable<DateTime>(depositAt.value);
    }
    if (withdrawAt.present) {
      map['withdraw_at'] = Variable<DateTime>(withdrawAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('amount: $amount, ')
          ..write('status: $status, ')
          ..write('uuid: $uuid, ')
          ..write('wdUuid: $wdUuid, ')
          ..write('depositAt: $depositAt, ')
          ..write('withdrawAt: $withdrawAt')
          ..write(')'))
        .toString();
  }
}

class $RecordsTable extends Records with TableInfo<$RecordsTable, Record> {
  final GeneratedDatabase _db;
  final String _alias;
  $RecordsTable(this._db, [this._alias]);
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
        defaultValue: const Constant(RecordStatus.deposited));
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  GeneratedTextColumn _uuid;
  @override
  GeneratedTextColumn get uuid => _uuid ??= _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn(
      'uuid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _wdUuidMeta = const VerificationMeta('wdUuid');
  GeneratedTextColumn _wdUuid;
  @override
  GeneratedTextColumn get wdUuid => _wdUuid ??= _constructWdUuid();
  GeneratedTextColumn _constructWdUuid() {
    return GeneratedTextColumn(
      'wd_uuid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _depositAtMeta = const VerificationMeta('depositAt');
  GeneratedDateTimeColumn _depositAt;
  @override
  GeneratedDateTimeColumn get depositAt => _depositAt ??= _constructDepositAt();
  GeneratedDateTimeColumn _constructDepositAt() {
    return GeneratedDateTimeColumn(
      'deposit_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _withdrawAtMeta = const VerificationMeta('withdrawAt');
  GeneratedDateTimeColumn _withdrawAt;
  @override
  GeneratedDateTimeColumn get withdrawAt =>
      _withdrawAt ??= _constructWithdrawAt();
  GeneratedDateTimeColumn _constructWithdrawAt() {
    return GeneratedDateTimeColumn(
      'withdraw_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, code, amount, status, uuid, wdUuid, depositAt, withdrawAt];
  @override
  $RecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'records';
  @override
  final String actualTableName = 'records';
  @override
  VerificationContext validateIntegrity(Insertable<Record> instance,
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
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid'], _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('wd_uuid')) {
      context.handle(_wdUuidMeta,
          wdUuid.isAcceptableOrUnknown(data['wd_uuid'], _wdUuidMeta));
    } else if (isInserting) {
      context.missing(_wdUuidMeta);
    }
    if (data.containsKey('deposit_at')) {
      context.handle(_depositAtMeta,
          depositAt.isAcceptableOrUnknown(data['deposit_at'], _depositAtMeta));
    } else if (isInserting) {
      context.missing(_depositAtMeta);
    }
    if (data.containsKey('withdraw_at')) {
      context.handle(
          _withdrawAtMeta,
          withdrawAt.isAcceptableOrUnknown(
              data['withdraw_at'], _withdrawAtMeta));
    } else if (isInserting) {
      context.missing(_withdrawAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Record map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Record.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RecordsTable createAlias(String alias) {
    return $RecordsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CommoditiesTable _commodities;
  $CommoditiesTable get commodities => _commodities ??= $CommoditiesTable(this);
  $RecordsTable _records;
  $RecordsTable get records => _records ??= $RecordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [commodities, records];
}
