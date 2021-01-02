import 'package:hooks_riverpod/all.dart';

import '../local/commodity/dao/commodity.dao.dart';
import 'app_data_base_provider.dart';

final commodityDaoProvider = Provider<CommodityDao>(
    (ref) => CommodityDao(ref.read(appDatabaseProvider)));
