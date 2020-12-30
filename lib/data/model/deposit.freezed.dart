// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deposit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Deposit _$DepositFromJson(Map<String, dynamic> json) {
  return _Deposit.fromJson(json);
}

/// @nodoc
class _$DepositTearOff {
  const _$DepositTearOff();

// ignore: unused_element
  _Deposit call(
      {String name,
      String code,
      String description,
      String status,
      String depositBy,
      DateTime depositAt}) {
    return _Deposit(
      name: name,
      code: code,
      description: description,
      status: status,
      depositBy: depositBy,
      depositAt: depositAt,
    );
  }

// ignore: unused_element
  Deposit fromJson(Map<String, Object> json) {
    return Deposit.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Deposit = _$DepositTearOff();

/// @nodoc
mixin _$Deposit {
  String get name;
  String get code;
  String get description;
  String get status;
  String get depositBy;
  DateTime get depositAt;

  Map<String, dynamic> toJson();
  $DepositCopyWith<Deposit> get copyWith;
}

/// @nodoc
abstract class $DepositCopyWith<$Res> {
  factory $DepositCopyWith(Deposit value, $Res Function(Deposit) then) =
      _$DepositCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String code,
      String description,
      String status,
      String depositBy,
      DateTime depositAt});
}

/// @nodoc
class _$DepositCopyWithImpl<$Res> implements $DepositCopyWith<$Res> {
  _$DepositCopyWithImpl(this._value, this._then);

  final Deposit _value;
  // ignore: unused_field
  final $Res Function(Deposit) _then;

  @override
  $Res call({
    Object name = freezed,
    Object code = freezed,
    Object description = freezed,
    Object status = freezed,
    Object depositBy = freezed,
    Object depositAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
      description:
          description == freezed ? _value.description : description as String,
      status: status == freezed ? _value.status : status as String,
      depositBy: depositBy == freezed ? _value.depositBy : depositBy as String,
      depositAt:
          depositAt == freezed ? _value.depositAt : depositAt as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$DepositCopyWith<$Res> implements $DepositCopyWith<$Res> {
  factory _$DepositCopyWith(_Deposit value, $Res Function(_Deposit) then) =
      __$DepositCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String code,
      String description,
      String status,
      String depositBy,
      DateTime depositAt});
}

/// @nodoc
class __$DepositCopyWithImpl<$Res> extends _$DepositCopyWithImpl<$Res>
    implements _$DepositCopyWith<$Res> {
  __$DepositCopyWithImpl(_Deposit _value, $Res Function(_Deposit) _then)
      : super(_value, (v) => _then(v as _Deposit));

  @override
  _Deposit get _value => super._value as _Deposit;

  @override
  $Res call({
    Object name = freezed,
    Object code = freezed,
    Object description = freezed,
    Object status = freezed,
    Object depositBy = freezed,
    Object depositAt = freezed,
  }) {
    return _then(_Deposit(
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
      description:
          description == freezed ? _value.description : description as String,
      status: status == freezed ? _value.status : status as String,
      depositBy: depositBy == freezed ? _value.depositBy : depositBy as String,
      depositAt:
          depositAt == freezed ? _value.depositAt : depositAt as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Deposit implements _Deposit {
  _$_Deposit(
      {this.name,
      this.code,
      this.description,
      this.status,
      this.depositBy,
      this.depositAt});

  factory _$_Deposit.fromJson(Map<String, dynamic> json) =>
      _$_$_DepositFromJson(json);

  @override
  final String name;
  @override
  final String code;
  @override
  final String description;
  @override
  final String status;
  @override
  final String depositBy;
  @override
  final DateTime depositAt;

  @override
  String toString() {
    return 'Deposit(name: $name, code: $code, description: $description, status: $status, depositBy: $depositBy, depositAt: $depositAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Deposit &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.depositBy, depositBy) ||
                const DeepCollectionEquality()
                    .equals(other.depositBy, depositBy)) &&
            (identical(other.depositAt, depositAt) ||
                const DeepCollectionEquality()
                    .equals(other.depositAt, depositAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(depositBy) ^
      const DeepCollectionEquality().hash(depositAt);

  @override
  _$DepositCopyWith<_Deposit> get copyWith =>
      __$DepositCopyWithImpl<_Deposit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepositToJson(this);
  }
}

abstract class _Deposit implements Deposit {
  factory _Deposit(
      {String name,
      String code,
      String description,
      String status,
      String depositBy,
      DateTime depositAt}) = _$_Deposit;

  factory _Deposit.fromJson(Map<String, dynamic> json) = _$_Deposit.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  String get description;
  @override
  String get status;
  @override
  String get depositBy;
  @override
  DateTime get depositAt;
  @override
  _$DepositCopyWith<_Deposit> get copyWith;
}
