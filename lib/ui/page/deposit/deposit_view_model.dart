import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/local/app_database.dart';
import '../../../data/provider/deposit_repository_provider.dart';
import '../../../data/repository/deposit_repository.dart';

final depositViewModelProvider = ChangeNotifierProvider(
    (ref) => DepositViewModel(ref.read(depositRepositoryProvider)));

class DepositItem {
  final String name;
  final String code;
  final double price;
  final int amount;
  final String description;

  DepositItem(this.name, this.code, this.price, this.amount, this.description);
}

class DepositViewModel extends ChangeNotifier {
  final DepositRepository _depositRepository;

  DepositViewModel(this._depositRepository);

  final List<DepositItem> _depositList = [];

  List<DepositItem> get depositList => _depositList;

  void addDepositItem(int amount, Commodity commodity) {
    _depositList.add(DepositItem(commodity.name, commodity.code,
        commodity.price, amount, commodity.description));
    notifyListeners();
  }

  Future submit() async {
    for (var item in depositList) {
      _depositRepository.addRecord(item.code, item.amount);
    }
    _depositList.clear();
    notifyListeners();
  }
}
