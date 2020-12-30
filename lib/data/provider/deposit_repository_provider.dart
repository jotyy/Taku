import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/deposit_repository.dart';
import '../repository/deposit_repository_impl.dart';
import 'deposit_local_data_source_provider.dart';

final depositRepositoryProvider = Provider<DepositRepository>(
    (ref) => DepositRepositoryImpl(ref.read(depositLocalDataSourceProvider)));
