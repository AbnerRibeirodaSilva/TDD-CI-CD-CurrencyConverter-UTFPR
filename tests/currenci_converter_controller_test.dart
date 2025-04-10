import 'package:currency_converter/feature/presenter/controllers/currency_converter_controller.dart';
import 'package:currency_converter/utils/currency_type_enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CurrencyConverterController controller;
  setUp(() {
    controller = CurrencyConverterController();
  });

  group(
    'Must convert one currency into another',
    () {
      test(
        'Convert 1 USD to EUR',
        () {
          controller.setFrom(CurrencyTypeEnum.USD);
          controller.setTo(CurrencyTypeEnum.EUR);
          controller.convertCurrency(
            amount: 1.0,
          );
          expect(controller.convertedAmount, 0.85);
        },
      );

      test(
        'Convert 100 EUR to USD',
        () {
          controller.setFrom(CurrencyTypeEnum.EUR);
          controller.setTo(CurrencyTypeEnum.USD);
          controller.convertCurrency(
            amount: 100.0,
          );
          expect(controller.convertedAmount, 117.65);
        },
      );

      test(
        'Convert 100 USD to BRL',
        () {
          controller.setFrom(CurrencyTypeEnum.USD);
          controller.setTo(CurrencyTypeEnum.BRL);
          controller.convertCurrency(
            amount: 100.0,
          );
          expect(controller.convertedAmount, 500.0);
        },
      );
    },
  );
}
