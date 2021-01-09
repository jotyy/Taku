import 'package:moor/moor.dart';

import '../../app_database.dart';
import '../../withdraw/table/withdraw.table.dart';
import '../table/record.table.dart';

part 'record.dao.g.dart';

@UseDao(tables: [Records, Withdraws])
class RecordDao extends DatabaseAccessor<AppDatabase> with _$RecordDaoMixin {
  RecordDao(AppDatabase db) : super(db);

  Future<List<Record>> getAllRecords() => select(records).get();

  Future<List<Record>> getDepositRecords() =>
      (select(records)..where((tbl) => tbl.status.equals(0))).get();

  Future<List<Record>> getDepositRecordsWithCode(String code) =>
      (select(records)
            ..where((tbl) => tbl.code.equals(code))
            ..where((tbl) => tbl.status.equals(RecordStatus.deposited))
            ..orderBy([(t) => OrderingTerm(expression: t.id)]))
          .get();

  Future<List<Withdraw>> getWithdrawRecords() => select(withdraws).get();

  Future<int> insertRecord(RecordsCompanion record) =>
      into(records).insert(record.copyWith(depositAt: Value(DateTime.now())));

  Future insertWithdrawRecord(WithdrawsCompanion withdraw) => into(withdraws)
      .insert(withdraw.copyWith(withdrawAt: Value(DateTime.now())));

  Future updateStatus(int id, int status) =>
      (update(records)..where((tbl) => tbl.id.equals(id)))
          .write(RecordsCompanion(
        status: Value(status),
        withdrawAt: Value(DateTime.now()),
      ));

  Future updateAmount(int id, int amount) =>
      (update(records)..where((tbl) => tbl.id.equals(id)))
          .write(RecordsCompanion(amount: Value(amount)));

  Future deleteRecord(int id) =>
      (delete(records)..where((tbl) => tbl.id.equals(id))).go();
}
