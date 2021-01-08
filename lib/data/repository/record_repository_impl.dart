import 'package:moor/moor.dart';

import '../../util/date_util.dart';
import '../local/app_database.dart';
import '../local/commodity/commodity_local_data_source.dart';
import '../local/record/record_local_data_source.dart';
import '../local/record/table/record.table.dart';
import '../model/deposit_record.dart';
import '../model/result.dart';
import 'record_repository.dart';

class RecordRepositoryImpl extends RecordRepository {
  final RecordLocalDataSource _recordLocalSource;
  final CommodityLocalDataSource _commodityLocalDataSource;

  RecordRepositoryImpl(this._recordLocalSource, this._commodityLocalDataSource);

  @override
  Future<Result<List<DepositRecord>>> getRecords() async {
    return Result.guardFuture(_records);
  }

  @override
  Future<Result<List<DepositRecord>>> getUnWithdrawRecords() {
    return Result.guardFuture(() => _recordsWithStatus(RecordStatus.deposited));
  }

  @override
  Future<Result<List<DepositRecord>>> getWithdrawedRecords() {
    return Result.guardFuture(
        () => _recordsWithStatus(RecordStatus.withdrawed));
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
  Future editRecordStatus(int id, int status) {
    return _recordLocalSource.updateRecordStatus(id, status);
  }

  @override
  Future deleteRecord(int id) => _recordLocalSource.deleteRecord(id);

  @override
  Future<Result<List<DepositRecord>>> getRecordsByDate(DateTime dateTime) {
    return Result.guardFuture(() => _recordsFilterWithDate(dateTime));
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

  Future<List<DepositRecord>> _recordsWithStatus(int status) async {
    final result = <DepositRecord>[];
    final records = await _recordLocalSource.getDepositRecords();
    for (var record in records) {
      if (record.status == status) {
        result.add(DepositRecord(
            record: record,
            commodity: await _commodityLocalDataSource
                .getCommodityByCode(record.code)));
      }
    }
    return result;
  }

  Future<List<DepositRecord>> _recordsFilterWithDate(DateTime dateTime) async {
    final result = <DepositRecord>[];
    final records = await _recordLocalSource.getDepositRecords();
    for (var record in records) {
      if (DateUtil.isSameDay(record.depositAt, dateTime)) {
        result.add(DepositRecord(
            record: record,
            commodity: await _commodityLocalDataSource
                .getCommodityByCode(record.code)));
      }
    }
    return result;
  }
}
