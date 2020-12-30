import '../app_database.dart';

abstract class CommodityLocalDataSource {
  Future<List<Commodity>> getCommodities();
  Future addCommodity(CommoditysCompanion commodity);
  Future deleteCommodity(int id);
}
