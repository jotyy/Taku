import 'package:moor/moor.dart';

import '../../app_database.dart';
import '../table/deposit.table.dart';

part 'deposit.dao.g.dart';

@UseDao(tables: [Deposits])
class DepositDao extends DatabaseAccessor<AppDatabase> with _$DepositDaoMixin {
  DepositDao(AppDatabase db) : super(db);

  Future<List<Deposit>> getDeposits() => select(deposits).get();

  Future<Deposit> getDeposit(int id) =>
      (select(deposits)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future insertDeposit(DepositsCompanion deposit) =>
      into(deposits).insert(deposit);

  Future deleteDeposit(int id) => deleteDeposit(id);
}
