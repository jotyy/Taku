import '../model/deposit_record.dart';

abstract class DepositRepository {
  Future<List<DepositRecord>> getRecords();
  Future addRecord(String code, int amount);
  Future deleteRecord(int id);
}
