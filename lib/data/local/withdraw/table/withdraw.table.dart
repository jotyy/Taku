import 'package:moor/moor.dart';

class Withdraws extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text()();
  IntColumn get amount => integer()();
  TextColumn get uuid => text()();
  DateTimeColumn get withdrawAt => dateTime()();
}
