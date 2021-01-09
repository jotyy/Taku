import 'dart:math';

import 'package:intl/intl.dart';
import 'package:moor/moor.dart';
import '../app_database.dart';
import 'dao/record.dao.dart';
import 'record_local_data_source.dart';

class RecordLocalSourceImpl extends RecordLocalDataSource {
  final RecordDao _recordDao;

  RecordLocalSourceImpl(this._recordDao);

  @override
  Future<int> addRecord(RecordsCompanion record) =>
      _recordDao.insertRecord(record.copyWith(
        uuid: Value(_generateUuid()),
      ));

  String _generateUuid() =>
      // ignore: lines_longer_than_80_chars
      'DC${DateFormat('yyMMddHHmmss').format(DateTime.now())}${_random(1001, 9999)}';

  int _random(int min, int max) => min + Random().nextInt(max - min);

  @override
  Future<List<Record>> getDepositRecords() => _recordDao.getDepositRecords();

  @override
  Future<List<Record>> getDepositRecordsWithCode(String code) =>
      _recordDao.getDepositRecordsWithCode(code);

  @override
  Future<List<Record>> getWithdrawRecords() => _recordDao.getWithdrawRecords();

  @override
  Future updateRecordStatus(int id, int status) {
    return _recordDao.updateStatus(id, status);
  }

  @override
  Future updateRecordAmount(int id, int num) =>
      _recordDao.updateAmount(id, num);

  @override
  Future deleteRecord(int id) => _recordDao.deleteRecord(id);
}
