import '../app_database.dart';

abstract class RecordLocalDataSource {
  Future<List<Record>> getDepositRecords();
  Future<List<Record>> getDepositRecordsWithCode(String code);
  Future<List<Record>> getWithdrawRecords();
  Future<int> addRecord(RecordsCompanion record);
  Future updateRecordStatus(int id, int status);
  Future updateRecordAmount(int id, int num);
  Future deleteRecord(int id);
}
