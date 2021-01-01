import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'commodity/table/commodity.table.dart';
import 'deposit/table/deposit.table.dart';

part 'app_database.g.dart';

@UseMoor(tables: [Commoditys, Deposits])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'taku_db.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}
