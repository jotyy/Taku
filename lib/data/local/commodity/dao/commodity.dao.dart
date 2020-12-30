import 'package:moor/moor.dart';

import '../../app_database.dart';
import '../table/commodity.table.dart';

part 'commodity.dao.g.dart';

@UseDao(tables: [Commoditys])
class CommodityDao extends DatabaseAccessor<AppDatabase>
    with _$CommodityDaoMixin {
  CommodityDao(AppDatabase db) : super(db);

  Future<List<Commodity>> getCommodities() => select(commoditys).get();

  Future insertCommodity(CommoditysCompanion commodity) =>
      into(commoditys).insert(commodity);

  Future deleteCommodity(int id) => deleteCommodity(id);
}
