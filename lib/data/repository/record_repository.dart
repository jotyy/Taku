import '../model/deposit_record.dart';
import '../model/result.dart';
import '../model/withdraw_commodity.dart';

abstract class RecordRepository {
  Future<Result<List<DepositRecord>>> getRecords();
  Future<Result<List<DepositRecord>>> getRecordsByDate(DateTime dateTime);
  Future<Result<List<WithdrawCommodity>>> getUnWithdrawRecords();
  Future<Result<List<WithdrawCommodity>>> getWithdrawedRecords();
  Future withdrawCommodities(int num, String code);
  Future<int> addRecord(String code, int amount);
  Future editRecordStatus(int id, int status);
  Future deleteRecord(int id);
}
