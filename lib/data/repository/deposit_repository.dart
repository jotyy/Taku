import 'package:app/data/model/deposit_record.dart';

abstract class DepositRepository {
  Future<List<DepositRecord>> getRecords();
}
