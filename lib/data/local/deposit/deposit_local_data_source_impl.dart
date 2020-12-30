import '../app_database.dart';
import 'dao/deposit.dao.dart';
import 'deposit_local_data_source.dart';

class DepositLocalDataSourceImpl extends DepositLocalDataSource {
  final DepositDao dao;

  DepositLocalDataSourceImpl(this.dao);

  @override
  Future addDeposit(Deposit deposit) {}

  @override
  Future<Deposit> getDepositById(int id) {}

  @override
  Future<List<Deposit>> getDepositHistory() {}

  @override
  Future removeDeposit(int id) {}
}
