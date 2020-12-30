import 'package:hooks_riverpod/all.dart';

import '../local/deposit/dao/deposit.dao.dart';
import 'app_data_base_provider.dart';

final depositDaoProvider =
    Provider<DepositDao>((ref) => DepositDao(ref.read(appDatabaseProvider)));
