import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../local/record/dao/record.dao.dart';
import '../local/record/record_local_data_source.dart';
import '../local/record/record_local_data_source_impl.dart';
import 'app_data_base_provider.dart';

final recordDaoProvider =
    Provider<RecordDao>((ref) => RecordDao(ref.read(appDatabaseProvider)));

final recordLocalDataSouceProvider = Provider<RecordLocalDataSource>(
    (ref) => RecordLocalSourceImpl(ref.read(recordDaoProvider)));
