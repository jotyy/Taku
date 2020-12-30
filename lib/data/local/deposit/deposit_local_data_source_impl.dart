import '../app_database.dart';
import 'dao/deposit.dao.dart';
import 'deposit_local_data_source.dart';

class DepositLocalDataSourceImpl extends DepositLocalDataSource {
  final DepositDao dao;

  DepositLocalDataSourceImpl(this.dao);

  @override
  Future addDeposit(DepositsCompanion deposit) {
    return dao.insertDeposit(deposit);
  }

  @override
  Future<List<Deposit>> getDeposits() {
    return dao.getDeposits();
  }

  @override
  Future removeDeposit(int id) {
    return dao.deleteDeposit(id);
  }
}
