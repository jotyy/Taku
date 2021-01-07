import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/record_repository.dart';
import '../repository/record_repository_impl.dart';
import 'commondity_local_data_source_provider.dart';
import 'record_providers.dart';

final recordRepositoryProvider =
    Provider<RecordRepository>((ref) => RecordRepositoryImpl(
          ref.read(recordLocalDataSouceProvider),
          ref.read(commodityLocalDataSourceProvider),
        ));
