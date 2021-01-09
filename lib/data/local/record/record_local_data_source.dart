import '../app_database.dart';

abstract class RecordLocalDataSource {
  Future<List<Record>> getDepositRecords();
  Future<List<Record>> getDepositRecordsWithCode(String code);
  Future<List<Withdraw>> getWithdrawRecords();
  Future<int> addRecord(RecordsCompanion record);
  Future<int> addWithdrawRecord(WithdrawsCompanion withdraw);
  Future updateRecordStatus(int id, int status);
  Future updateRecordAmount(int id, int num);
  Future deleteRecord(int id);
}
