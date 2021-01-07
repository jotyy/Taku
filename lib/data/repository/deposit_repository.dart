import '../model/deposit_record.dart';
import '../model/result.dart';

abstract class RecordRepository {
  Future<Result<List<DepositRecord>>> getRecords();
  Future<Result<List<DepositRecord>>> getUnWithdrawRecords();
  Future<Result<List<DepositRecord>>> getWithdrawedRecords();
  Future<int> addRecord(String code, int amount);
  Future editRecordStatus(int id, int status);
  Future deleteRecord(int id);
}
