import '../local/app_database.dart';
import '../model/result.dart';

abstract class CommodityRepository {
  Future<Result<List<Commodity>>> getCommodities();

  Future<Result<List<Commodity>>> getCommoditiesByName(String name);

  Future<Result<Commodity>> getCommodityByCode(String code);

  Future addCommodity(CommoditiesCompanion commodity);

  Future deleteCommodity(int id);
}
