import '../local/app_database.dart';

abstract class CommodityRepository {
  Future<List<Commodity>> getCommodities();

  Future addCommodity(CommoditiesCompanion commodity);
}
