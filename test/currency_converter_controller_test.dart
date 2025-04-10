import 'package:currency_converter/feature/presenter/controllers/currency_converter_controller.dart';
import 'package:currency_converter/utils/currency_type_enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CurrencyConverterController controller;
  setUp(() {
    controller = CurrencyConverterController();
  });

  group(
    'All tests',
    () {
      test(
        'Convert 1 USD to EUR',
        () {
          controller.setFrom(CurrencyTypeEnum.usd);
          controller.setTo(CurrencyTypeEnum.eur);
          controller.convertCurrency(
            amount: 1.0,
          );
          expect(controller.convertedAmount, 0.85);
        },
      );

      test(
        'Convert 100 EUR to USD',
        () {
          controller.setFrom(CurrencyTypeEnum.eur);
          controller.setTo(CurrencyTypeEnum.usd);
          controller.convertCurrency(
            amount: 100.0,
          );
          expect(controller.convertedAmount, 118.00);
        },
      );

      test(
        'Convert 100 USD to BRL',
        () {
          controller.setFrom(CurrencyTypeEnum.usd);
          controller.setTo(CurrencyTypeEnum.brl);
          controller.convertCurrency(
            amount: 100.0,
          );
          expect(controller.convertedAmount, 572.0);
        },
      );

      test(
        'Convert 0 USD to EUR (should result in 0)',
        () {
          controller.setFrom(CurrencyTypeEnum.usd);
          controller.setTo(CurrencyTypeEnum.eur);
          controller.convertCurrency(amount: 0.0);
          expect(controller.convertedAmount, 0.0);
        },
      );

      test(
        'Convert -50 USD to EUR (should handle gracefully)',
        () {
          controller.setFrom(CurrencyTypeEnum.usd);
          controller.setTo(CurrencyTypeEnum.eur);
          controller.convertCurrency(amount: -50.0);
          expect(controller.convertedAmount, -42.5);
        },
      );

      test(
        'Convert same currency (USD to USD)',
        () {
          controller.setFrom(CurrencyTypeEnum.usd);
          controller.setTo(CurrencyTypeEnum.usd);
          controller.convertCurrency(amount: 100.0);
          expect(controller.convertedAmount, 100.0);
        },
      );

      test(
        'Convert without setting "from" or "to" currency (should default USD to USS)',
        () {
          controller.convertCurrency(amount: 100.0);
          expect(controller.convertedAmount, 100.0);
        },
      );
    },
  );
}
