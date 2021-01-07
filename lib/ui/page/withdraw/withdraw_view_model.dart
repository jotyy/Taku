import 'package:app/data/local/record/table/record.table.dart';
import 'package:app/data/model/deposit_item.dart';
import 'package:app/data/model/deposit_record.dart';
import 'package:app/data/model/result.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/provider/deposit_repository_provider.dart';
import '../../../data/repository/deposit_repository.dart';

final withdrawViewModelProvider = ChangeNotifierProvider(
    (ref) => WithdrawViewModel(ref.read(depositRepositoryProvider)));

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
