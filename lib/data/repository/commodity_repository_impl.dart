import '../local/app_database.dart';
import '../local/commodity/commodity_local_data_source.dart';
import 'commodity_repository.dart';

class CommodityRepositoryImpl extends CommodityRepository {
  final CommodityLocalDataSource localSource;

  CommodityRepositoryImpl(this.localSource);

  @override
  Future addCommodity(CommoditysCompanion commodity) {
    return localSource.addCommodity(commodity);
  }

  @override
  Future<List<Commodity>> getCommodities() {
    return localSource.getCommodities();
  }
}
