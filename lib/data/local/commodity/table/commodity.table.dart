import 'package:moor/moor.dart';

/// deposit table
@DataClassName('Commodity')
class Commodities extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 20)();
  TextColumn get description => text().withLength(min: 1, max: 50)();
  RealColumn get price => real().withDefault(const Constant(0.0))();
  TextColumn get code => text().withLength(min: 1, max: 50)();
  IntColumn get status => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
}
