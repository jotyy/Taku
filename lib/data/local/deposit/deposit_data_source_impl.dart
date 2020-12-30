import '../../model/deposit.dart';

import 'deposit_data_source.dart';

class DepositDataSourceImpl extends DepositDataSource {
  @override
  Future addDeposit(Deposit deposit) {
  }

  @override
  Future<Deposit> getDepositById(int id) {}

  @override
  Future<List<Deposit>> getDepositHistory() {}

  @override
  Future removeDeposit(int id) {}
}
