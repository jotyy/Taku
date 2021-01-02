import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/commodity_repository.dart';
import '../repository/commodity_repository_impl.dart';
import 'commondity_local_data_source_provider.dart';

final commodityRepositoryProvider = Provider<CommodityRepository>(
    (ref) => CommodityRepositoryImpl(ref.read(commodityLocalDataSourceProvider)));
