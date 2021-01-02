import 'package:hooks_riverpod/all.dart';

import '../local/commodity/commodity_local_data_source.dart';
import '../local/commodity/commodity_local_data_source_impl.dart';
import 'commodity_dao_provider.dart';

final commodityLocalDataSourceProvider = Provider<CommodityLocalDataSource>(
    (ref) => CommodityLocalDataSourceImpl(ref.read(commodityDaoProvider)));
