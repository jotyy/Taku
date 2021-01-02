import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/deposit_repository.dart';
import '../repository/deposit_repository_impl.dart';
import 'commondity_local_data_source_provider.dart';
import 'record_providers.dart';

final depositRepositoryProvider = Provider<DepositRepository>((ref) =>
    DepositRepositoryImpl(ref.read(recordLocalDataSouceProvider),
        ref.read(commodityLocalDataSourceProvider)));
