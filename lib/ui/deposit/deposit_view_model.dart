import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/model/result.dart';
import '../../data/provider/commodity_repository_provider.dart';
import '../../data/repository/commodity_repository.dart';

final depositViewModelProvider = ChangeNotifierProvider(
    (ref) => DepositViewModel(ref.read(commodityRepositoryProvider)));

class DepositViewModel extends ChangeNotifier {
  final CommodityRepository _depositRepository;

  DepositViewModel(this._depositRepository);

  Result<List<Commodity>> _deposits;

  Result<List<Commodity>> get deposits => _deposits;

  Future fetchDeposits() {
    return _depositRepository
        .getCommodities()
        .then((value) => _deposits = Result.success(data: value))
        .whenComplete(notifyListeners);
  }

  Future addDeposit(CommoditysCompanion deposit) {
    return _depositRepository
        .addCommodity(deposit)
        .then((value) => fetchDeposits())
        .whenComplete(notifyListeners);
  }
}
