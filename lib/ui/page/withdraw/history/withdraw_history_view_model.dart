import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/model/result.dart';
import '../../../../data/model/withdraw_commodity.dart';
import '../../../../data/provider/record_repository_provider.dart';
import '../../../../data/repository/record_repository.dart';

final withdrawViewModelProvider = ChangeNotifierProvider(
    (ref) => WithdrawHistoryViewModel(ref.read(recordRepositoryProvider)));

class WithdrawHistoryViewModel extends ChangeNotifier {
  final RecordRepository _recordRepository;

  WithdrawHistoryViewModel(this._recordRepository);

  Result<List<WithdrawCommodity>> _recordList;
  Result<List<WithdrawCommodity>> get recordList => _recordList;

  Future fetchWithdrawHistory() {
    return _recordRepository
        .getWithdrawedRecords()
        .then((value) => _recordList = value)
        .whenComplete(notifyListeners);
  }
}
