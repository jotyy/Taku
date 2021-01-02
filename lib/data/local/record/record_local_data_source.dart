import '../app_database.dart';

abstract class RecordLocalDataSource {
  Future<List<Record>> getRecords();
  Future addRecord(RecordsCompanion record);
  Future deleteRecord(int id);
}
