import '../app_database.dart';

abstract class CommodityLocalDataSource {
  Future<List<Commodity>> getCommodities();
  Future<List<Commodity>> getCommoditiesByName(String name);
  Future<Commodity> getCommodityByCode(String code);
  Future addCommodity(CommoditiesCompanion commodity);
  Future deleteCommodity(int id);
}
