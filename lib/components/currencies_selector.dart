import 'package:flutter/material.dart';

class CurrenciesSelector extends StatelessWidget {
  CurrenciesSelector({
    @required this.selectedCrypto,
    @required this.selectedValue,
    @required this.resultHandler,
    @required this.cryptoCurrencies,
    @required this.physicalCurrencies,
  });

  final String selectedCrypto;
  final String selectedValue;
  final Function resultHandler;
  final List cryptoCurrencies;
  final List physicalCurrencies;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        DropdownButton(
            value: selectedCrypto,
            items: cryptoCurrencies.map((crypto) {
              return DropdownMenuItem(
                child: Text(
                  crypto,
                  style: TextStyle(color: Colors.white),
                ),
                value: crypto,
              );
            }).toList(),
            onChanged: resultHandler),
        DropdownButton(
            value: selectedValue,
            items: physicalCurrencies.map((currency) {
              return DropdownMenuItem(
                child: Text(
                  currency,
                  style: TextStyle(color: Colors.white),
                ),
                value: currency,
              );
            }).toList(),
            onChanged: resultHandler),
      ],
    );
  }
}
