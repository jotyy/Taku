import 'package:moor/moor.dart';

import '../../app_database.dart';
import '../table/commodity.table.dart';

part 'commodity.dao.g.dart';

@UseDao(tables: [Commodities])
class CommodityDao extends DatabaseAccessor<AppDatabase>
    with _$CommodityDaoMixin {
  CommodityDao(AppDatabase db) : super(db);

  Future<Commodity> getCommodityByCode(String code) =>
      (select(commodities)..where((c) => c.code.equals(code))).getSingle();

  Future<List<Commodity>> getCommodities() => select(commodities).get();

  Future insertCommodity(CommoditiesCompanion commodity) =>
      into(commodities).insert(commodity);

  Future deleteCommodity(int id) => deleteCommodity(id);
}
