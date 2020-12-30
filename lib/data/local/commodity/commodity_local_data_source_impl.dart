import '../app_database.dart';

import 'commodity_local_data_source.dart';
import 'dao/commodity.dao.dart';

class DepositLocalDataSourceImpl extends CommodityLocalDataSource {
  final CommodityDao dao;

  DepositLocalDataSourceImpl(this.dao);

  @override
  Future addCommodity(CommoditysCompanion commodity) {
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
