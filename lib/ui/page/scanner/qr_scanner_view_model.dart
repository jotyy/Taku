import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/app_error.dart';
import '../../../data/local/app_database.dart';
import '../../../data/model/result.dart';
import '../../../data/provider/commodity_repository_provider.dart';
import '../../../data/repository/commodity_repository.dart';

final qrScannerViewModelProvider = ChangeNotifierProvider(
    (ref) => QRScannerViewModel(ref.read(commodityRepositoryProvider)));

class QRScannerViewModel extends ChangeNotifier {
  final CommodityRepository _commodityRepository;

  QRScannerViewModel(this._commodityRepository);

  Result<Commodity> _commodity;

  Result<Commodity> get commodity => _commodity;

  Future getCommodityByCode(String code) {
    return _commodityRepository
        .getCommodityByCode(code)
        .then((value) => _commodity = value)
        .whenComplete(notifyListeners);
  }
}
