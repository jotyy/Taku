import 'package:moor/moor.dart';

class RecordStatus {
  static const deposited = 0;
  static const withdrawed = 1;
}

class Records extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(min: 1, max: 20)();
  IntColumn get amount => integer()();
  // status
  // 0. 入库
  // 1. 出库
  IntColumn get status =>
      integer().withDefault(const Constant(RecordStatus.deposited))();
  TextColumn get uuid => text()();
  DateTimeColumn get depositAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}
