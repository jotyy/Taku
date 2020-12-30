import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/model/result.dart';
import '../../data/provider/deposit_repository_provider.dart';
import '../../data/repository/deposit_repository.dart';

final depositViewModelProvider = ChangeNotifierProvider(
    (ref) => DepositViewModel(ref.read(depositRepositoryProvider)));

class DepositViewModel extends ChangeNotifier {
  final DepositRepository _depositRepository;

  DepositViewModel(this._depositRepository);

  Result<List<Deposit>> _deposits;
  Result<List<Deposit>> get deposits => _deposits;

  Future fetchDeposits() {
    return _depositRepository
        .getDeposits()
        .then((value) => _deposits = Result.success(data: value))
        .whenComplete(notifyListeners);
  }

  Future addDeposit(DepositsCompanion deposit) {
    return _depositRepository
        .addDeposit(deposit)
        .then((value) => fetchDeposits())
        .whenComplete(notifyListeners);
  }
}
