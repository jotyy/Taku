import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/local/app_database.dart';
import '../../../../data/model/result.dart';
import '../../../../data/provider/record_repository_provider.dart';
import '../../../../data/repository/record_repository.dart';

final withdrawHistoryViewModelProvider = ChangeNotifierProvider(
    (ref) => WithdrawHistoryViewModel(ref.read(recordRepositoryProvider)));

class WithdrawHistoryViewModel extends ChangeNotifier {
  final RecordRepository _recordRepository;

  WithdrawHistoryViewModel(this._recordRepository);

  Result<List<Withdraw>> _recordList;
  Result<List<Withdraw>> get recordList => _recordList;

  Future fetchWithdrawHistory({DateTime dateTime}) {
    if (dateTime == null) dateTime = DateTime.now();
    return _recordRepository
        .getWithdrawedRecords(dateTime)
        .then((value) => _recordList = value)
        .whenComplete(notifyListeners);
  }
}
