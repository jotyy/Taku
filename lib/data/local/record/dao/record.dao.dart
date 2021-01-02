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

  Future insertRecord(RecordsCompanion record) => into(records).insert(record);

  Future deleteRecord(int id) => deleteRecord(id);
}
