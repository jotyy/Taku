import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants.dart';
import '../../../data/local/app_database.dart';
import '../../../data/model/deposit_item.dart';
import '../../../data/provider/deposit_repository_provider.dart';
import '../../../data/repository/deposit_repository.dart';

final depositViewModelProvider = ChangeNotifierProvider(
    (ref) => DepositViewModel(ref.read(depositRepositoryProvider)));

class DepositViewModel extends ChangeNotifier {
  final RecordRepository _depositRepository;

  DepositViewModel(this._depositRepository);

  final List<DepositItem> _depositList = [];

  List<DepositItem> get depositList => _depositList;

  void addDepositItem(int amount, Commodity commodity) {
    _depositList.add(DepositItem(
        name: commodity.name,
        code: commodity.code,
        price: commodity.price,
        amount: amount,
        description: commodity.description));
    notifyListeners();
  }

  void editDepositItem(int index, DepositItem item) {
    _depositList[index] = item;
    notifyListeners();
  }

  Future submit() async {
    for (var item in depositList) {
      _depositRepository.addRecord(item.code, item.amount);
    }
    _depositList.clear();
    Get.defaultDialog(
        title: '提交成功',
        middleText: '',
        textConfirm: '确认',
        onConfirm: () {
          Get.back();
          Get.toNamed(Constants.pageDepositHistory);
        });
    notifyListeners();
  }
}
