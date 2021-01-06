// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deposit_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DepositItem _$DepositItemFromJson(Map<String, dynamic> json) {
  return _DepositItem.fromJson(json);
}

/// @nodoc
class _$DepositItemTearOff {
  const _$DepositItemTearOff();

// ignore: unused_element
  _DepositItem call(
      {String name,
      String code,
      double price,
      int amount,
      String description}) {
    return _DepositItem(
      name: name,
      code: code,
      price: price,
      amount: amount,
      description: description,
    );
  }

// ignore: unused_element
  DepositItem fromJson(Map<String, Object> json) {
    return DepositItem.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepositItem = _$DepositItemTearOff();

/// @nodoc
mixin _$DepositItem {
  String get name;
  String get code;
  double get price;
  int get amount;
  String get description;

  Map<String, dynamic> toJson();
  $DepositItemCopyWith<DepositItem> get copyWith;
}

/// @nodoc
abstract class $DepositItemCopyWith<$Res> {
  factory $DepositItemCopyWith(
          DepositItem value, $Res Function(DepositItem) then) =
      _$DepositItemCopyWithImpl<$Res>;
  $Res call(
      {String name, String code, double price, int amount, String description});
}

/// @nodoc
class _$DepositItemCopyWithImpl<$Res> implements $DepositItemCopyWith<$Res> {
  _$DepositItemCopyWithImpl(this._value, this._then);

  final DepositItem _value;
  // ignore: unused_field
  final $Res Function(DepositItem) _then;

  @override
  $Res call({
    Object name = freezed,
    Object code = freezed,
    Object price = freezed,
    Object amount = freezed,
    Object description = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
      price: price == freezed ? _value.price : price as double,
      amount: amount == freezed ? _value.amount : amount as int,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

/// @nodoc
abstract class _$DepositItemCopyWith<$Res>
    implements $DepositItemCopyWith<$Res> {
  factory _$DepositItemCopyWith(
          _DepositItem value, $Res Function(_DepositItem) then) =
      __$DepositItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name, String code, double price, int amount, String description});
}

/// @nodoc
class __$DepositItemCopyWithImpl<$Res> extends _$DepositItemCopyWithImpl<$Res>
    implements _$DepositItemCopyWith<$Res> {
  __$DepositItemCopyWithImpl(
      _DepositItem _value, $Res Function(_DepositItem) _then)
      : super(_value, (v) => _then(v as _DepositItem));

  @override
  _DepositItem get _value => super._value as _DepositItem;

  @override
  $Res call({
    Object name = freezed,
    Object code = freezed,
    Object price = freezed,
    Object amount = freezed,
    Object description = freezed,
  }) {
    return _then(_DepositItem(
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
      price: price == freezed ? _value.price : price as double,
      amount: amount == freezed ? _value.amount : amount as int,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepositItem implements _DepositItem {
  _$_DepositItem(
      {this.name, this.code, this.price, this.amount, this.description});

  factory _$_DepositItem.fromJson(Map<String, dynamic> json) =>
      _$_$_DepositItemFromJson(json);

  @override
  final String name;
  @override
  final String code;
  @override
  final double price;
  @override
  final int amount;
  @override
  final String description;

  @override
  String toString() {
    return 'DepositItem(name: $name, code: $code, price: $price, amount: $amount, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepositItem &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(description);

  @override
  _$DepositItemCopyWith<_DepositItem> get copyWith =>
      __$DepositItemCopyWithImpl<_DepositItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepositItemToJson(this);
  }
}

abstract class _DepositItem implements DepositItem {
  factory _DepositItem(
      {String name,
      String code,
      double price,
      int amount,
      String description}) = _$_DepositItem;

  factory _DepositItem.fromJson(Map<String, dynamic> json) =
      _$_DepositItem.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  double get price;
  @override
  int get amount;
  @override
  String get description;
  @override
  _$DepositItemCopyWith<_DepositItem> get copyWith;
}
