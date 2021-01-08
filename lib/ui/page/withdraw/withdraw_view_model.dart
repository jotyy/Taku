import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/local/record/table/record.table.dart';
import '../../../data/model/result.dart';
import '../../../data/model/withdraw_commodity.dart';
import '../../../data/provider/record_repository_provider.dart';
import '../../../data/repository/record_repository.dart';

final withdrawViewModelProvider = ChangeNotifierProvider(
    (ref) => WithdrawViewModel(ref.read(recordRepositoryProvider)));

class WithdrawViewModel extends ChangeNotifier {
  WithdrawViewModel(this._repository);

  final RecordRepository _repository;

  Result<List<WithdrawCommodity>> _withdrawedList;
  Result<List<WithdrawCommodity>> get withdrawedList => _withdrawedList;
  Result<List<WithdrawCommodity>> _unWithdrawList;
  Result<List<WithdrawCommodity>> get unWithdrawList => _unWithdrawList;

  Future fetchUnWithdrawedRecord() {
    return _repository
        .getUnWithdrawRecords()
        .then((value) => _unWithdrawList = value)
        .whenComplete(notifyListeners);
  }

  Future fetchWithdrawedRecord() {
    return _repository
        .getWithdrawedRecords()
        .then((value) => _withdrawedList = value)
        .whenComplete(notifyListeners);
  }

  Future withdraw(int id) {
    return _repository
        .editRecordStatus(id, RecordStatus.withdrawed)
        .then((value) {
      fetchUnWithdrawedRecord();
      fetchWithdrawedRecord();
    }).whenComplete(notifyListeners);
  }
}
