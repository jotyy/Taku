// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Deposit extends DataClass implements Insertable<Deposit> {
  final int id;
  final String name;
  final String code;
  final String description;
  final int status;
  final String depositBy;
  final DateTime depositAt;
  Deposit(
      {@required this.id,
      @required this.name,
      @required this.code,
      @required this.description,
      @required this.status,
      @required this.depositBy,
      @required this.depositAt});
  factory Deposit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Deposit(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      depositBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deposit_by']),
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
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || depositBy != null) {
      map['deposit_by'] = Variable<String>(depositBy);
    }
    if (!nullToAbsent || depositAt != null) {
      map['deposit_at'] = Variable<DateTime>(depositAt);
    }
    return map;
  }

  DepositsCompanion toCompanion(bool nullToAbsent) {
    return DepositsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      depositBy: depositBy == null && nullToAbsent
          ? const Value.absent()
          : Value(depositBy),
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
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
      description: serializer.fromJson<String>(json['description']),
      status: serializer.fromJson<int>(json['status']),
      depositBy: serializer.fromJson<String>(json['depositBy']),
      depositAt: serializer.fromJson<DateTime>(json['depositAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
      'description': serializer.toJson<String>(description),
      'status': serializer.toJson<int>(status),
      'depositBy': serializer.toJson<String>(depositBy),
      'depositAt': serializer.toJson<DateTime>(depositAt),
    };
  }

  Deposit copyWith(
          {int id,
          String name,
          String code,
          String description,
          int status,
          String depositBy,
          DateTime depositAt}) =>
      Deposit(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        description: description ?? this.description,
        status: status ?? this.status,
        depositBy: depositBy ?? this.depositBy,
        depositAt: depositAt ?? this.depositAt,
      );
  @override
  String toString() {
    return (StringBuffer('Deposit(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('depositBy: $depositBy, ')
          ..write('depositAt: $depositAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              code.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(status.hashCode,
                      $mrjc(depositBy.hashCode, depositAt.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Deposit &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.description == this.description &&
          other.status == this.status &&
          other.depositBy == this.depositBy &&
          other.depositAt == this.depositAt);
}

class DepositsCompanion extends UpdateCompanion<Deposit> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> code;
  final Value<String> description;
  final Value<int> status;
  final Value<String> depositBy;
  final Value<DateTime> depositAt;
  const DepositsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.depositBy = const Value.absent(),
    this.depositAt = const Value.absent(),
  });
  DepositsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String code,
    @required String description,
    this.status = const Value.absent(),
    @required String depositBy,
    this.depositAt = const Value.absent(),
  })  : name = Value(name),
        code = Value(code),
        description = Value(description),
        depositBy = Value(depositBy);
  static Insertable<Deposit> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> code,
    Expression<String> description,
    Expression<int> status,
    Expression<String> depositBy,
    Expression<DateTime> depositAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (depositBy != null) 'deposit_by': depositBy,
      if (depositAt != null) 'deposit_at': depositAt,
    });
  }

  DepositsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> code,
      Value<String> description,
      Value<int> status,
      Value<String> depositBy,
      Value<DateTime> depositAt}) {
    return DepositsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      status: status ?? this.status,
      depositBy: depositBy ?? this.depositBy,
      depositAt: depositAt ?? this.depositAt,
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
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (depositBy.present) {
      map['deposit_by'] = Variable<String>(depositBy.value);
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
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('depositBy: $depositBy, ')
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

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn('code', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
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

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn('status', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _depositByMeta = const VerificationMeta('depositBy');
  GeneratedTextColumn _depositBy;
  @override
  GeneratedTextColumn get depositBy => _depositBy ??= _constructDepositBy();
  GeneratedTextColumn _constructDepositBy() {
    return GeneratedTextColumn('deposit_by', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
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
  List<GeneratedColumn> get $columns =>
      [id, name, code, description, status, depositBy, depositAt];
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
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    if (data.containsKey('deposit_by')) {
      context.handle(_depositByMeta,
          depositBy.isAcceptableOrUnknown(data['deposit_by'], _depositByMeta));
    } else if (isInserting) {
      context.missing(_depositByMeta);
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
  $DepositsTable _deposits;
  $DepositsTable get deposits => _deposits ??= $DepositsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [deposits];
}
