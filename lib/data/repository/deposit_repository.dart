import '../model/deposit_record.dart';
import '../model/result.dart';

abstract class DepositRepository {
  Future<Result<List<DepositRecord>>> getRecords();
  Future<int> addRecord(String code, int amount);
  Future deleteRecord(int id);
}
