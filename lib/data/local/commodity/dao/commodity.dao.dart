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

  Future<List<Commodity>> getCommodityByName(String name) =>
      (select(commodities)..where((c) => c.name.like("%$name%"))).get();

  Future<List<Commodity>> getCommodities() => select(commodities).get();

  Future insertCommodity(CommoditiesCompanion commodity) => into(commodities)
      .insert(commodity.copyWith(createdAt: Value(DateTime.now())));

  Future deleteCommodity(int id) =>
      (delete(commodities)..where((c) => c.id.equals(id))).go();
}
