
import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_commodity.freezed.dart';
part 'withdraw_commodity.g.dart';

@freezed
abstract class WithdrawCommodity with _$WithdrawCommodity {
  factory WithdrawCommodity(
    String name,
    String code,
    String description,
    int balance,
    double total,
  ) = _WithdrawCommodity;
	
  factory WithdrawCommodity.fromJson(Map<String, dynamic> json) =>
			_$WithdrawCommodityFromJson(json);
}
