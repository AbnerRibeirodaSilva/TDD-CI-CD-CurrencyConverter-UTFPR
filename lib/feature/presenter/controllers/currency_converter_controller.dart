import 'package:flutter/foundation.dart';

import '../../../utils/currency_type_enum.dart';

class CurrencyConverterController extends ChangeNotifier {
  double _convertedAmount = 0.0;

  double get convertedAmount => _convertedAmount;

  CurrencyTypeEnum _from = CurrencyTypeEnum.usd;

  CurrencyTypeEnum _to = CurrencyTypeEnum.usd;

  CurrencyTypeEnum get from => _from;

  CurrencyTypeEnum get to => _to;

  void setFrom(CurrencyTypeEnum from) {
    _from = from;
    notifyListeners();
  }

  void setTo(CurrencyTypeEnum to) {
    _to = to;
    notifyListeners();
  }

  void convertCurrency({
    required double amount,
  }) {
    switch ('${from.name}/${to.name}') {
      case 'usd/brl':
        _convertedAmount = amount * 5.72;
        break;
      case 'usd/eur':
        _convertedAmount = amount * 0.85;
        break;
      case 'eur/usd':
        _convertedAmount = amount * 1.18;
        break;
      case 'eur/brl':
        _convertedAmount = amount * 6.50;
        break;
      case 'brl/usd':
        _convertedAmount = amount * 0.18;
        break;
      case 'brl/eur':
        _convertedAmount = amount * 0.15;
        break;
      case 'usd/usd':
      case 'eur/eur':
      case 'brl/brl':
        _convertedAmount = amount;
        break;
      default:
        throw Exception('Invalid currency conversion');
    }
    notifyListeners();
  }
}
