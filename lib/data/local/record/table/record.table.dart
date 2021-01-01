import 'package:moor/moor.dart';

class Records extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(min: 1, max: 20)();
  IntColumn get amount => integer()();
  // status
  // 0. 入库
  // 1. 出库
  IntColumn get status => integer().withDefault(const Constant(0))();
  DateTimeColumn get depositAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}
