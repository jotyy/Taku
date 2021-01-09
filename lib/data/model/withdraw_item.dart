
import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_item.freezed.dart';
part 'withdraw_item.g.dart';

@freezed
abstract class WithdrawItem with _$WithdrawItem {
  factory WithdrawItem(
    String id,
    String code,
    String name,
    double total, 
    int amount,
  ) = _WithdrawItem;
	
  factory WithdrawItem.fromJson(Map<String, dynamic> json) =>
			_$WithdrawItemFromJson(json);
}
