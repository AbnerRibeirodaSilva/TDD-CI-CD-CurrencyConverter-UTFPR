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
      case 'USD/BRL':
        _convertedAmount = amount * 5.72;
        break;
      case 'USD/EUR':
        _convertedAmount = amount * 0.85;
        break;
      case 'EUR/USD':
        _convertedAmount = amount * 1.18;
        break;
      case 'EUR/BRL':
        _convertedAmount = amount * 6.50;
        break;
      case 'BRL/USD':
        _convertedAmount = amount * 0.18;
        break;
      case 'BRL/EUR':
        _convertedAmount = amount * 0.15;
        break;
      case 'USD/USD':
      case 'EUR/EUR':
      case 'BRL/BRL':
        _convertedAmount = amount;
        break;
      default:
        throw Exception('Invalid currency conversion');
    }
    notifyListeners();
  }
}
