// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deposit_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DepositRecord _$DepositRecordFromJson(Map<String, dynamic> json) {
  return _DepositRecord.fromJson(json);
}

/// @nodoc
class _$DepositRecordTearOff {
  const _$DepositRecordTearOff();

// ignore: unused_element
  _DepositRecord call({Record record, Commodity commodity}) {
    return _DepositRecord(
      record: record,
      commodity: commodity,
    );
  }

// ignore: unused_element
  DepositRecord fromJson(Map<String, Object> json) {
    return DepositRecord.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepositRecord = _$DepositRecordTearOff();

/// @nodoc
mixin _$DepositRecord {
  Record get record;
  Commodity get commodity;

  Map<String, dynamic> toJson();
  $DepositRecordCopyWith<DepositRecord> get copyWith;
}

/// @nodoc
abstract class $DepositRecordCopyWith<$Res> {
  factory $DepositRecordCopyWith(
          DepositRecord value, $Res Function(DepositRecord) then) =
      _$DepositRecordCopyWithImpl<$Res>;
  $Res call({Record record, Commodity commodity});
}

/// @nodoc
class _$DepositRecordCopyWithImpl<$Res>
    implements $DepositRecordCopyWith<$Res> {
  _$DepositRecordCopyWithImpl(this._value, this._then);

  final DepositRecord _value;
  // ignore: unused_field
  final $Res Function(DepositRecord) _then;

  @override
  $Res call({
    Object record = freezed,
    Object commodity = freezed,
  }) {
    return _then(_value.copyWith(
      record: record == freezed ? _value.record : record as Record,
      commodity:
          commodity == freezed ? _value.commodity : commodity as Commodity,
    ));
  }
}

/// @nodoc
abstract class _$DepositRecordCopyWith<$Res>
    implements $DepositRecordCopyWith<$Res> {
  factory _$DepositRecordCopyWith(
          _DepositRecord value, $Res Function(_DepositRecord) then) =
      __$DepositRecordCopyWithImpl<$Res>;
  @override
  $Res call({Record record, Commodity commodity});
}

/// @nodoc
class __$DepositRecordCopyWithImpl<$Res>
    extends _$DepositRecordCopyWithImpl<$Res>
    implements _$DepositRecordCopyWith<$Res> {
  __$DepositRecordCopyWithImpl(
      _DepositRecord _value, $Res Function(_DepositRecord) _then)
      : super(_value, (v) => _then(v as _DepositRecord));

  @override
  _DepositRecord get _value => super._value as _DepositRecord;

  @override
  $Res call({
    Object record = freezed,
    Object commodity = freezed,
  }) {
    return _then(_DepositRecord(
      record: record == freezed ? _value.record : record as Record,
      commodity:
          commodity == freezed ? _value.commodity : commodity as Commodity,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepositRecord implements _DepositRecord {
  _$_DepositRecord({this.record, this.commodity});

  factory _$_DepositRecord.fromJson(Map<String, dynamic> json) =>
      _$_$_DepositRecordFromJson(json);

  @override
  final Record record;
  @override
  final Commodity commodity;

  @override
  String toString() {
    return 'DepositRecord(record: $record, commodity: $commodity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepositRecord &&
            (identical(other.record, record) ||
                const DeepCollectionEquality().equals(other.record, record)) &&
            (identical(other.commodity, commodity) ||
                const DeepCollectionEquality()
                    .equals(other.commodity, commodity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(record) ^
      const DeepCollectionEquality().hash(commodity);

  @override
  _$DepositRecordCopyWith<_DepositRecord> get copyWith =>
      __$DepositRecordCopyWithImpl<_DepositRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepositRecordToJson(this);
  }
}

abstract class _DepositRecord implements DepositRecord {
  factory _DepositRecord({Record record, Commodity commodity}) =
      _$_DepositRecord;

  factory _DepositRecord.fromJson(Map<String, dynamic> json) =
      _$_DepositRecord.fromJson;

  @override
  Record get record;
  @override
  Commodity get commodity;
  @override
  _$DepositRecordCopyWith<_DepositRecord> get copyWith;
}
