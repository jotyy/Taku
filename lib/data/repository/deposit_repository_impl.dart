import 'package:moor/moor.dart';

import '../local/app_database.dart';
import '../local/commodity/commodity_local_data_source.dart';
import '../local/record/record_local_data_source.dart';
import '../model/deposit_record.dart';
import '../model/result.dart';
import 'deposit_repository.dart';

class DepositRepositoryImpl extends DepositRepository {
  final RecordLocalDataSource _recordLocalSource;
  final CommodityLocalDataSource _commodityLocalDataSource;

  DepositRepositoryImpl(
      this._recordLocalSource, this._commodityLocalDataSource);

  @override
  Future<Result<List<DepositRecord>>> getRecords() async {
    return Result.guardFuture(_records);
  }

  Future<List<DepositRecord>> _records() async {
    final result = <DepositRecord>[];
    final records = await _recordLocalSource.getDepositRecords();
    for (var record in records) {
      result.add(DepositRecord(
          record: record,
          commodity:
              await _commodityLocalDataSource.getCommodityByCode(record.code)));
    }
    return result;
  }

  @override
  Future<int> addRecord(String code, int amount) {
    final params = RecordsCompanion(
      code: Value(code),
      amount: Value(amount),
    );

    return _recordLocalSource.addRecord(params);
  }

  @override
  Future deleteRecord(int id) => _recordLocalSource.deleteRecord(id);
}
