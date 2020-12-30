import '../local/app_database.dart';
import '../local/deposit/deposit_local_data_source.dart';

import 'deposit_repository.dart';

class DepositRepositoryImpl extends DepositRepository {
  final DepositLocalDataSource localSource;

  DepositRepositoryImpl(this.localSource);

  @override
  Future addDeposit(DepositsCompanion deposit) {
    return localSource.addDeposit(deposit);
  }

  @override
  Future<List<Deposit>> getDeposits() {
    return localSource.getDeposits();
  }
}
