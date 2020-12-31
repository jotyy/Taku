import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/model/result.dart';
import '../../data/provider/commodity_repository_provider.dart';
import '../../data/repository/commodity_repository.dart';

final depositViewModelProvider = ChangeNotifierProvider(
    (ref) => DepositViewModel(ref.read(commodityRepositoryProvider)));

class DepositViewModel extends ChangeNotifier {
  final CommodityRepository _commodityRepository;

  DepositViewModel(this._commodityRepository);

  Result<List<Commodity>> _commodities;

  Result<List<Commodity>> get commodities => _commodities;

  Future fetchDeposits() {
    return _commodityRepository
        .getCommodities()
        .then((value) => _commodities = Result.success(data: value))
        .whenComplete(notifyListeners);
  }

  Future addDeposit(CommoditysCompanion deposit) {
    return _commodityRepository
        .addCommodity(deposit)
        .then((value) => fetchDeposits())
        .whenComplete(notifyListeners);
  }
}
