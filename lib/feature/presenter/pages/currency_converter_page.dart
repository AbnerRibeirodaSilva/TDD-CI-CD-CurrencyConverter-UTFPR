import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/currency_type_enum.dart';
import '../controllers/currency_converter_controller.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final CurrencyConverterController _controller = CurrencyConverterController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, widget) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Currency Converter'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<CurrencyTypeEnum>(
                  decoration: const InputDecoration(labelText: 'From Currency'),
                  items: const [
                    DropdownMenuItem(
                      value: CurrencyTypeEnum.usd,
                      child: Text('USD'),
                    ),
                    DropdownMenuItem(
                      value: CurrencyTypeEnum.eur,
                      child: Text('EUR'),
                    ),
                    DropdownMenuItem(
                      value: CurrencyTypeEnum.brl,
                      child: Text('BRL'),
                    ),
                  ],
                  onChanged: (value) {
                    _controller.setFrom(value!);
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<CurrencyTypeEnum>(
                  decoration: const InputDecoration(labelText: 'To Currency'),
                  items: const [
                    DropdownMenuItem(
                      value: CurrencyTypeEnum.usd,
                      child: Text('USD'),
                    ),
                    DropdownMenuItem(
                      value: CurrencyTypeEnum.eur,
                      child: Text('EUR'),
                    ),
                    DropdownMenuItem(
                      value: CurrencyTypeEnum.brl,
                      child: Text('BRL'),
                    ),
                  ],
                  onChanged: (value) {
                    _controller.setTo(value!);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    final double? amount = double.tryParse(value);
                    if (amount == null || amount <= 0) {
                      return 'Please enter a valid amount';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d+\.?\d{0,2}'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _controller.convertCurrency(
                    amount: double.tryParse(_amountController.text) ?? 0.0,
                  ),
                  child: const Text('Convert'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Result: ${_controller.convertedAmount}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
