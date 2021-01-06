import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/model/deposit_record.dart';
import '../../../data/model/result.dart';
import '../../../data/provider/deposit_repository_provider.dart';
import '../../../data/repository/deposit_repository.dart';

final depositHistoryViewModelProvider = ChangeNotifierProvider(
    (ref) => DepositHistoryViewModel(ref.read(depositRepositoryProvider)));

class DepositHistoryViewModel extends ChangeNotifier {
  final DepositRepository _depositRepository;

  DepositHistoryViewModel(this._depositRepository);

  Result<List<DepositRecord>> _records;

  Result<List<DepositRecord>> get records => _records;

  Future fetchDepositHistory() {
    return _depositRepository
        .getRecords()
        .then((value) => _records = value)
        .whenComplete(notifyListeners);
  }
}
