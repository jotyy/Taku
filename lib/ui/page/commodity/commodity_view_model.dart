import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moor/moor.dart';

import '../../../data/local/app_database.dart';
import '../../../data/model/result.dart';
import '../../../data/provider/commodity_repository_provider.dart';
import '../../../data/repository/commodity_repository.dart';

final commodityViewModelProvider = ChangeNotifierProvider(
    (ref) => CommodityViewModel(ref.read(commodityRepositoryProvider)));

class CommodityViewModel extends ChangeNotifier {
  final CommodityRepository _commodityRepository;

  CommodityViewModel(this._commodityRepository);

  Result<List<Commodity>> _commodities;
  Result<List<Commodity>> get commodities => _commodities;

  Future fetchCommoditiesByName({String name = ''}) {
    return _commodityRepository
        .getCommoditiesByName(name)
        .then((value) => _commodities = Result.success(data: value))
        .whenComplete(notifyListeners);
  }

  Future addCommodity(String name, String desc, String price, String code) {
    final commodity = CommoditiesCompanion(
      name: Value(name),
      description: Value(desc),
      price: Value(double.parse(price)),
      code: Value(code),
    );
    return _commodityRepository
        .addCommodity(commodity)
        .then((value) => getx.Get.back());
  }

  Future removeCommodity(int id) {
    return _commodityRepository
        .deleteCommodity(id)
        .then((value) => fetchCommoditiesByName())
        .whenComplete(notifyListeners);
  }
}
