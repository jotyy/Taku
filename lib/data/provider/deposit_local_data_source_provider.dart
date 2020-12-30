import 'package:hooks_riverpod/all.dart';

import '../local/deposit/deposit_local_data_source.dart';
import '../local/deposit/deposit_local_data_source_impl.dart';
import 'deposit_dao_provider.dart';

final depositLocalDataSourceProvider = Provider<DepositLocalDataSource>(
    (ref) => DepositLocalDataSourceImpl(ref.read(depositDaoProvider)));
