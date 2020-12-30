import '../app_database.dart';

abstract class DepositLocalDataSource {
  Future<Deposit> getDepositById(int id);
  Future<List<Deposit>> getDepositHistory();
  Future addDeposit(Deposit deposit);
  Future removeDeposit(int id);
}
