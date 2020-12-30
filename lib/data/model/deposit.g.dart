// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Deposit _$_$_DepositFromJson(Map<String, dynamic> json) {
  return _$_Deposit(
    name: json['name'] as String,
    code: json['code'] as String,
    description: json['description'] as String,
    status: json['status'] as String,
    depositBy: json['depositBy'] as String,
    depositAt: json['depositAt'] == null
        ? null
        : DateTime.parse(json['depositAt'] as String),
  );
}

Map<String, dynamic> _$_$_DepositToJson(_$_Deposit instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'status': instance.status,
      'depositBy': instance.depositBy,
      'depositAt': instance.depositAt?.toIso8601String(),
    };
