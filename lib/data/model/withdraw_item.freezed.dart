// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'withdraw_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
WithdrawItem _$WithdrawItemFromJson(Map<String, dynamic> json) {
  return _WithdrawItem.fromJson(json);
}

/// @nodoc
class _$WithdrawItemTearOff {
  const _$WithdrawItemTearOff();

// ignore: unused_element
  _WithdrawItem call(
      String id, String code, String name, double total, int amount) {
    return _WithdrawItem(
      id,
      code,
      name,
      total,
      amount,
    );
  }

// ignore: unused_element
  WithdrawItem fromJson(Map<String, Object> json) {
    return WithdrawItem.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $WithdrawItem = _$WithdrawItemTearOff();

/// @nodoc
mixin _$WithdrawItem {
  String get id;
  String get code;
  String get name;
  double get total;
  int get amount;

  Map<String, dynamic> toJson();
  $WithdrawItemCopyWith<WithdrawItem> get copyWith;
}

/// @nodoc
abstract class $WithdrawItemCopyWith<$Res> {
  factory $WithdrawItemCopyWith(
          WithdrawItem value, $Res Function(WithdrawItem) then) =
      _$WithdrawItemCopyWithImpl<$Res>;
  $Res call({String id, String code, String name, double total, int amount});
}

/// @nodoc
class _$WithdrawItemCopyWithImpl<$Res> implements $WithdrawItemCopyWith<$Res> {
  _$WithdrawItemCopyWithImpl(this._value, this._then);

  final WithdrawItem _value;
  // ignore: unused_field
  final $Res Function(WithdrawItem) _then;

  @override
  $Res call({
    Object id = freezed,
    Object code = freezed,
    Object name = freezed,
    Object total = freezed,
    Object amount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      code: code == freezed ? _value.code : code as String,
      name: name == freezed ? _value.name : name as String,
      total: total == freezed ? _value.total : total as double,
      amount: amount == freezed ? _value.amount : amount as int,
    ));
  }
}

/// @nodoc
abstract class _$WithdrawItemCopyWith<$Res>
    implements $WithdrawItemCopyWith<$Res> {
  factory _$WithdrawItemCopyWith(
          _WithdrawItem value, $Res Function(_WithdrawItem) then) =
      __$WithdrawItemCopyWithImpl<$Res>;
  @override
  $Res call({String id, String code, String name, double total, int amount});
}

/// @nodoc
class __$WithdrawItemCopyWithImpl<$Res> extends _$WithdrawItemCopyWithImpl<$Res>
    implements _$WithdrawItemCopyWith<$Res> {
  __$WithdrawItemCopyWithImpl(
      _WithdrawItem _value, $Res Function(_WithdrawItem) _then)
      : super(_value, (v) => _then(v as _WithdrawItem));

  @override
  _WithdrawItem get _value => super._value as _WithdrawItem;

  @override
  $Res call({
    Object id = freezed,
    Object code = freezed,
    Object name = freezed,
    Object total = freezed,
    Object amount = freezed,
  }) {
    return _then(_WithdrawItem(
      id == freezed ? _value.id : id as String,
      code == freezed ? _value.code : code as String,
      name == freezed ? _value.name : name as String,
      total == freezed ? _value.total : total as double,
      amount == freezed ? _value.amount : amount as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_WithdrawItem implements _WithdrawItem {
  _$_WithdrawItem(this.id, this.code, this.name, this.total, this.amount)
      : assert(id != null),
        assert(code != null),
        assert(name != null),
        assert(total != null),
        assert(amount != null);

  factory _$_WithdrawItem.fromJson(Map<String, dynamic> json) =>
      _$_$_WithdrawItemFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  final double total;
  @override
  final int amount;

  @override
  String toString() {
    return 'WithdrawItem(id: $id, code: $code, name: $name, total: $total, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WithdrawItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(amount);

  @override
  _$WithdrawItemCopyWith<_WithdrawItem> get copyWith =>
      __$WithdrawItemCopyWithImpl<_WithdrawItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WithdrawItemToJson(this);
  }
}

abstract class _WithdrawItem implements WithdrawItem {
  factory _WithdrawItem(
          String id, String code, String name, double total, int amount) =
      _$_WithdrawItem;

  factory _WithdrawItem.fromJson(Map<String, dynamic> json) =
      _$_WithdrawItem.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  String get name;
  @override
  double get total;
  @override
  int get amount;
  @override
  _$WithdrawItemCopyWith<_WithdrawItem> get copyWith;
}
