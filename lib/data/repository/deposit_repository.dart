import '../local/app_database.dart';

abstract class DepositRepository {
  Future<List<Deposit>> getDeposits();
  Future addDeposit(DepositsCompanion deposit);
}
