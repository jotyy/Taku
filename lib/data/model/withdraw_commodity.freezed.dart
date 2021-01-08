// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'withdraw_commodity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
WithdrawCommodity _$WithdrawCommodityFromJson(Map<String, dynamic> json) {
  return _WithdrawCommodity.fromJson(json);
}

/// @nodoc
class _$WithdrawCommodityTearOff {
  const _$WithdrawCommodityTearOff();

// ignore: unused_element
  _WithdrawCommodity call(
      String name, String code, String description, int balance, double total) {
    return _WithdrawCommodity(
      name,
      code,
      description,
      balance,
      total,
    );
  }

// ignore: unused_element
  WithdrawCommodity fromJson(Map<String, Object> json) {
    return WithdrawCommodity.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $WithdrawCommodity = _$WithdrawCommodityTearOff();

/// @nodoc
mixin _$WithdrawCommodity {
  String get name;
  String get code;
  String get description;
  int get balance;
  double get total;

  Map<String, dynamic> toJson();
  $WithdrawCommodityCopyWith<WithdrawCommodity> get copyWith;
}

/// @nodoc
abstract class $WithdrawCommodityCopyWith<$Res> {
  factory $WithdrawCommodityCopyWith(
          WithdrawCommodity value, $Res Function(WithdrawCommodity) then) =
      _$WithdrawCommodityCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String code,
      String description,
      int balance,
      double total});
}

/// @nodoc
class _$WithdrawCommodityCopyWithImpl<$Res>
    implements $WithdrawCommodityCopyWith<$Res> {
  _$WithdrawCommodityCopyWithImpl(this._value, this._then);

  final WithdrawCommodity _value;
  // ignore: unused_field
  final $Res Function(WithdrawCommodity) _then;

  @override
  $Res call({
    Object name = freezed,
    Object code = freezed,
    Object description = freezed,
    Object balance = freezed,
    Object total = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
      description:
          description == freezed ? _value.description : description as String,
      balance: balance == freezed ? _value.balance : balance as int,
      total: total == freezed ? _value.total : total as double,
    ));
  }
}

/// @nodoc
abstract class _$WithdrawCommodityCopyWith<$Res>
    implements $WithdrawCommodityCopyWith<$Res> {
  factory _$WithdrawCommodityCopyWith(
          _WithdrawCommodity value, $Res Function(_WithdrawCommodity) then) =
      __$WithdrawCommodityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String code,
      String description,
      int balance,
      double total});
}

/// @nodoc
class __$WithdrawCommodityCopyWithImpl<$Res>
    extends _$WithdrawCommodityCopyWithImpl<$Res>
    implements _$WithdrawCommodityCopyWith<$Res> {
  __$WithdrawCommodityCopyWithImpl(
      _WithdrawCommodity _value, $Res Function(_WithdrawCommodity) _then)
      : super(_value, (v) => _then(v as _WithdrawCommodity));

  @override
  _WithdrawCommodity get _value => super._value as _WithdrawCommodity;

  @override
  $Res call({
    Object name = freezed,
    Object code = freezed,
    Object description = freezed,
    Object balance = freezed,
    Object total = freezed,
  }) {
    return _then(_WithdrawCommodity(
      name == freezed ? _value.name : name as String,
      code == freezed ? _value.code : code as String,
      description == freezed ? _value.description : description as String,
      balance == freezed ? _value.balance : balance as int,
      total == freezed ? _value.total : total as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_WithdrawCommodity implements _WithdrawCommodity {
  _$_WithdrawCommodity(
      this.name, this.code, this.description, this.balance, this.total)
      : assert(name != null),
        assert(code != null),
        assert(description != null),
        assert(balance != null),
        assert(total != null);

  factory _$_WithdrawCommodity.fromJson(Map<String, dynamic> json) =>
      _$_$_WithdrawCommodityFromJson(json);

  @override
  final String name;
  @override
  final String code;
  @override
  final String description;
  @override
  final int balance;
  @override
  final double total;

  @override
  String toString() {
    return 'WithdrawCommodity(name: $name, code: $code, description: $description, balance: $balance, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WithdrawCommodity &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(total);

  @override
  _$WithdrawCommodityCopyWith<_WithdrawCommodity> get copyWith =>
      __$WithdrawCommodityCopyWithImpl<_WithdrawCommodity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WithdrawCommodityToJson(this);
  }
}

abstract class _WithdrawCommodity implements WithdrawCommodity {
  factory _WithdrawCommodity(String name, String code, String description,
      int balance, double total) = _$_WithdrawCommodity;

  factory _WithdrawCommodity.fromJson(Map<String, dynamic> json) =
      _$_WithdrawCommodity.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  String get description;
  @override
  int get balance;
  @override
  double get total;
  @override
  _$WithdrawCommodityCopyWith<_WithdrawCommodity> get copyWith;
}
