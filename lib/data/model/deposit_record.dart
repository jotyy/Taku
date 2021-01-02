import 'package:freezed_annotation/freezed_annotation.dart';

import '../local/app_database.dart';

part 'deposit_record.freezed.dart';
part 'deposit_record.g.dart';

@freezed
abstract class DepositRecord with _$DepositRecord {
  factory DepositRecord({
    Record record,
    Commodity commodity,
  }) = _DepositRecord;

  factory DepositRecord.fromJson(Map<String, dynamic> json) =>
      _$DepositRecordFromJson(json);
}
