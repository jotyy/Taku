import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_item.freezed.dart';
part 'deposit_item.g.dart';

@freezed
abstract class DepositItem with _$DepositItem {
  factory DepositItem({
    String name,
    String code,
    double price,
    int amount,
    String description,
  }) = _DepositItem;

  factory DepositItem.fromJson(Map<String, dynamic> json) =>
      _$DepositItemFromJson(json);
}
