import 'package:moor/moor.dart';

import '../../app_database.dart';
import '../table/record.table.dart';

part 'record.dao.g.dart';

@UseDao(tables: [Records])
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

  Future<List<Record>> getWithdrawRecords() =>
      (select(records)..where((tbl) => tbl.status.equals(1))).get();

  Future<int> insertRecord(RecordsCompanion record) =>
      into(records).insert(record.copyWith(depositAt: Value(DateTime.now())));

  Future updateStatus(int id, int status, String wdUuid) =>
      (update(records)..where((tbl) => tbl.id.equals(id)))
          .write(RecordsCompanion(
        status: Value(status),
        withdrawAt: Value(DateTime.now()),
        wdUuid: Value(wdUuid)
      ));

  Future updateAmount(int id, int amount) =>
      (update(records)..where((tbl) => tbl.id.equals(id)))
          .write(RecordsCompanion(amount: Value(amount)));

  Future deleteRecord(int id) =>
      (delete(records)..where((tbl) => tbl.id.equals(id))).go();
}
