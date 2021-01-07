import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/model/deposit_record.dart';
import '../../../../data/model/result.dart';
import '../../../../data/provider/record_repository_provider.dart';
import '../../../../data/repository/record_repository.dart';

final depositHistoryViewModelProvider = ChangeNotifierProvider(
    (ref) => DepositHistoryViewModel(ref.read(recordRepositoryProvider)));

class DepositHistoryViewModel extends ChangeNotifier {
  final RecordRepository _depositRepository;

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
