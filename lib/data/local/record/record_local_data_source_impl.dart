import '../app_database.dart';
import 'dao/record.dao.dart';
import 'record_local_data_source.dart';

class RecordLocalSourceImpl extends RecordLocalDataSource {
  final RecordDao _recordDao;

  RecordLocalSourceImpl(this._recordDao);

  @override
  Future addRecord(RecordsCompanion record) {
    _recordDao.insertRecord(record);
  }

  @override
  Future<List<Record>> getRecords() {
    _recordDao.getRecords();
  }
}
