import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider(
    (ref) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {}
