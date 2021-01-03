import '../local/app_database.dart';
import '../local/commodity/commodity_local_data_source.dart';
import 'commodity_repository.dart';

class CommodityRepositoryImpl extends CommodityRepository {
  final CommodityLocalDataSource localSource;

  CommodityRepositoryImpl(this.localSource);

  @override
  Future addCommodity(CommoditiesCompanion commodity) {
    return localSource.addCommodity(commodity);
  }

  @override
  Future<List<Commodity>> getCommodities() {
    return localSource.getCommodities();
  }

  @override
  Future<List<Commodity>> getCommoditiesByName(String name) {
    return localSource.getCommoditiesByName(name);
  }

  @override
  Future<Commodity> getCommoditiyByCode(String code) {
    return localSource.getCommodityByCode(code);
  }
}
