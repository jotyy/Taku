// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DepositItem _$_$_DepositItemFromJson(Map<String, dynamic> json) {
  return _$_DepositItem(
    name: json['name'] as String,
    code: json['code'] as String,
    price: (json['price'] as num)?.toDouble(),
    amount: json['amount'] as int,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_DepositItemToJson(_$_DepositItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'price': instance.price,
      'amount': instance.amount,
      'description': instance.description,
    };
