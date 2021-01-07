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

  Future<List<Record>> getWithdrawRecords() =>
      (select(records)..where((tbl) => tbl.status.equals(1))).get();

  Future<int> insertRecord(RecordsCompanion record) =>
      into(records).insert(record);

  Future updateStatus(int id, int status) =>
      (update(records)..where((tbl) => tbl.id.equals(id)))
          .write(RecordsCompanion(status: Value(status)));

  Future deleteRecord(int id) => deleteRecord(id);
}
