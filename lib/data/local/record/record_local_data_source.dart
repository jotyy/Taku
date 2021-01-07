import '../app_database.dart';

abstract class RecordLocalDataSource {
  Future<List<Record>> getDepositRecords();
  Future<List<Record>> getWithdrawRecords();
  Future<int> addRecord(RecordsCompanion record);
  Future updateRecordStatus(int id, int status);
  Future deleteRecord(int id);
}
