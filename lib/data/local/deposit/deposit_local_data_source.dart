import '../app_database.dart';

abstract class DepositLocalDataSource {
  Future<List<Deposit>> getDeposits();
  Future addDeposit(DepositsCompanion deposit);
  Future removeDeposit(int id);
}
