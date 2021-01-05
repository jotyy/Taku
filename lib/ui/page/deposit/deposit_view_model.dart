import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/model/deposit_record.dart';
import '../../../data/model/result.dart';
import '../../../data/provider/deposit_repository_provider.dart';
import '../../../data/repository/deposit_repository.dart';

final depositViewModelProvider = ChangeNotifierProvider(
    (ref) => DepositViewModel(ref.read(depositRepositoryProvider)));

class DepositViewModel extends ChangeNotifier {
  final DepositRepository _repository;

  DepositViewModel(this._repository);

  Result<List<DepositRecord>> _records;

  Result<List<DepositRecord>> get records => _records;

  Future fetchCommodities({String name = ''}) {
    return _repository
        .getRecords()
        .then((value) => _records = Result.success(data: value))
        .whenComplete(notifyListeners);
  }
}
