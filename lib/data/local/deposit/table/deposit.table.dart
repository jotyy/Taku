import 'package:moor/moor.dart';

class Deposits extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(min: 1, max: 20)();
  IntColumn get amount => integer()();
  IntColumn get status => integer().withDefault(const Constant(0))();
  DateTimeColumn get depositAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}
