import '../app_database.dart';

import 'commodity_local_data_source.dart';
import 'dao/commodity.dao.dart';

class CommodityLocalDataSourceImpl extends CommodityLocalDataSource {
  final CommodityDao dao;

  CommodityLocalDataSourceImpl(this.dao);

  @override
  Future<Commodity> getCommodityByCode(String code) {
    return dao.getCommodityByCode(code);
  }

  @override
  Future<List<Commodity>> getCommoditiesByName(String name) {
    return dao.getCommodityByName(name);
  }

  @override
  Future addCommodity(CommoditiesCompanion commodity) {
    return dao.insertCommodity(commodity);
  }

  @override
  Future<List<Commodity>> getCommodities() {
    return dao.getCommodities();
  }

  @override
  Future deleteCommodity(int id) {
    return dao.deleteCommodity(id);
  }
}
