import 'package:moor/moor.dart';

import '../../app_database.dart';
import '../table/deposit.table.dart';

part 'deposit.dao.g.dart';

@UseDao(tables: [Deposits])
class DepositDao extends DatabaseAccessor<AppDatabase> with _$DepositDaoMixin {
  DepositDao(AppDatabase db) : super(db);
}
