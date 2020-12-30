import 'package:hooks_riverpod/all.dart';

import '../local/app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase());
