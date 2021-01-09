// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WithdrawItem _$_$_WithdrawItemFromJson(Map<String, dynamic> json) {
  return _$_WithdrawItem(
    json['id'] as String,
    json['code'] as String,
    json['name'] as String,
    (json['total'] as num)?.toDouble(),
    json['amount'] as int,
  );
}

Map<String, dynamic> _$_$_WithdrawItemToJson(_$_WithdrawItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'total': instance.total,
      'amount': instance.amount,
    };
