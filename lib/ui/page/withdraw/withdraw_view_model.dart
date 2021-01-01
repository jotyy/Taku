import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/local/app_database.dart';
import '../../../data/model/result.dart';
import '../../../data/provider/commodity_repository_provider.dart';
import '../../../data/repository/commodity_repository.dart';

final withdrawViewModelProvider = ChangeNotifierProvider(
    (ref) => WithdrawViewModel(ref.read(commodityRepositoryProvider)));

class WithdrawViewModel extends ChangeNotifier {
  final CommodityRepository _repository;

  WithdrawViewModel(this._repository);

  Result<List<Commodity>> _commodities;

  Result<List<Commodity>> get commodities => _commodities;

  Future fetchCommodities() {
    return _repository
        .getCommodities()
        .then((value) => _commodities = Result.success(data: value))
        .whenComplete(notifyListeners);
  }

  Future addCommodity(CommoditiesCompanion deposit) {
    return _repository
        .addCommodity(deposit)
        .then((value) => fetchCommodities())
        .whenComplete(notifyListeners);
  }
}
