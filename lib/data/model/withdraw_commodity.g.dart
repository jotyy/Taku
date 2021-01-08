// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_commodity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WithdrawCommodity _$_$_WithdrawCommodityFromJson(Map<String, dynamic> json) {
  return _$_WithdrawCommodity(
    json['name'] as String,
    json['code'] as String,
    json['description'] as String,
    json['balance'] as int,
    (json['total'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_WithdrawCommodityToJson(
        _$_WithdrawCommodity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'balance': instance.balance,
      'total': instance.total,
    };
