import '../local/app_database.dart';
import '../local/commodity/commodity_local_data_source.dart';
import '../model/result.dart';
import 'commodity_repository.dart';

class CommodityRepositoryImpl extends CommodityRepository {
  final CommodityLocalDataSource localSource;

  CommodityRepositoryImpl(this.localSource);

  @override
  Future addCommodity(CommoditiesCompanion commodity) {
    return localSource.addCommodity(commodity);
  }

  @override
  Future<Result<List<Commodity>>> getCommodities() {
    return Result.guardFuture(localSource.getCommodities);
  }

  @override
  Future<Result<List<Commodity>>> getCommoditiesByName(String name) {
    return Result.guardFuture(() => localSource.getCommoditiesByName(name));
  }

  @override
  Future<Result<Commodity>> getCommodityByCode(String code) {
    return Result.guardFuture(() => localSource.getCommodityByCode(code));
  }

  @override
  Future deleteCommodity(int id) {
    return localSource.deleteCommodity(id);
  }
}
