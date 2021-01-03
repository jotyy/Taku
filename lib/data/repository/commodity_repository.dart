import '../local/app_database.dart';

abstract class CommodityRepository {
  Future<List<Commodity>> getCommodities();

  Future<List<Commodity>> getCommoditiesByName(String name);

  Future<Commodity> getCommoditiyByCode(String code);

  Future addCommodity(CommoditiesCompanion commodity);
}
