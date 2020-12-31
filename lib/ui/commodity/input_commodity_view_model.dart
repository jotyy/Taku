import 'package:app/data/provider/commodity_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/model/result.dart';
import '../../data/repository/commodity_repository.dart';

final inputCommodityViewModelProvider = Provider<InputCommodityViewModel>(
    (ref) => InputCommodityViewModel(ref.read(commodityRepositoryProvider)));

class InputCommodityViewModel extends ChangeNotifier {
  final CommodityRepository _commodityRepository;

  InputCommodityViewModel(this._commodityRepository);

  Result<bool> _submitSuccess;

  Result<bool> get submitSuccess => _submitSuccess;

  Future submitCommodity(CommoditysCompanion commodity) {
    return _commodityRepository
        .addCommodity(commodity)
        .then((value) => const Result.success(data: true))
        .whenComplete(notifyListeners);
  }
}
