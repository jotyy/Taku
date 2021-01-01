import 'package:moor/moor.dart';

import '../../app_database.dart';
import '../table/record.table.dart';

part 'record.dao.g.dart';

@UseDao(tables: [Records])
class RecordDao extends DatabaseAccessor<AppDatabase> with _$RecordDaoMixin {
  RecordDao(AppDatabase db) : super(db);
}
