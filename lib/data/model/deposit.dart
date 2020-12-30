import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit.freezed.dart';

part 'deposit.g.dart';

@freezed
abstract class Deposit with _$Deposit {
  factory Deposit({
    String name,
    String code,
    String description,
    String status,
    String depositBy,
    DateTime depositAt,
  }) = _Deposit;

  factory Deposit.fromJson(Map<String, dynamic> json) =>
      _$DepositFromJson(json);
}
