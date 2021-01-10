import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'commodity/table/commodity.table.dart';
import 'record/table/record.table.dart';
import 'withdraw/table/withdraw.table.dart';

part 'app_database.g.dart';

@UseMoor(tables: [Commodities, Records, Withdraws])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from == 2) {
            await m.alterTable(TableMigration(withdraws));
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'taku_db.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}
