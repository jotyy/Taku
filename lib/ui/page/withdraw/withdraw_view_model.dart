import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/local/record/table/record.table.dart';
import '../../../data/model/deposit_record.dart';
import '../../../data/model/result.dart';
import '../../../data/provider/record_repository_provider.dart';
import '../../../data/repository/record_repository.dart';

final withdrawViewModelProvider = ChangeNotifierProvider(
    (ref) => WithdrawViewModel(ref.read(recordRepositoryProvider)));

class WithdrawViewModel extends ChangeNotifier {
  WithdrawViewModel(this._depositRepository);

  final RecordRepository _depositRepository;

  Result<List<DepositRecord>> _withdrawedList;
  Result<List<DepositRecord>> get withdrawedList => _withdrawedList;
  Result<List<DepositRecord>> _unWithdrawList;
  Result<List<DepositRecord>> get unWithdrawList => _unWithdrawList;

  Future fetchUnWithdrawedRecord() {
    return _depositRepository
        .getUnWithdrawRecords()
        .then((value) => _unWithdrawList = value)
        .whenComplete(notifyListeners);
  }

  Future fetchWithdrawedRecord() {
    return _depositRepository
        .getWithdrawedRecords()
        .then((value) => _withdrawedList = value)
        .whenComplete(notifyListeners);
  }

  Future withdraw(int id) {
    return _depositRepository
        .editRecordStatus(id, RecordStatus.withdrawed)
        .then((value) {
      fetchUnWithdrawedRecord();
      fetchWithdrawedRecord();
    }).whenComplete(notifyListeners);
  }
}
