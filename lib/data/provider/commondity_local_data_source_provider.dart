import 'package:hooks_riverpod/all.dart';

import '../local/commodity/commodity_local_data_source.dart';
import '../local/commodity/commodity_local_data_source_impl.dart';
import 'commodity_dao_provider.dart';

final depositLocalDataSourceProvider = Provider<CommodityLocalDataSource>(
    (ref) => DepositLocalDataSourceImpl(ref.read(depositDaoProvider)));
