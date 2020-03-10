import 'package:flutter/material.dart';

class CoinColors {
  static Color darkBlue = Color(0xFF182A56);
  static Color bluredDarkBlue = Color(0xFF0D1E4C);
}

List<Text> fiatList = kCurrenciesList.map(
  (fiat) {
    String fiatName;
    if (fiat == 'AUD') {
      fiatName = 'Australian Dollar';
    } else if (fiat == 'BRL') {
      fiatName = 'Brazilian Real';
    } else if (fiat == 'CAD') {
      fiatName = 'Canadian Dollar';
    } else if (fiat == 'CNY') {
      fiatName = 'Yuan';
    } else if (fiat == 'EUR') {
      fiatName = 'Euro';
    } else if (fiat == 'GBP') {
      fiatName = 'Pound';
    } else if (fiat == 'HKD') {
      fiatName = 'Hong Kong Dollar';
    } else if (fiat == 'IDR') {
      fiatName = 'Rupiah';
    } else if (fiat == 'ILS') {
      fiatName = 'Israeli Shekel';
    } else if (fiat == 'INR') {
      fiatName = 'Indian Rupee';
    } else if (fiat == 'JPY') {
      fiatName = 'Yen';
    } else if (fiat == 'MXN') {
      fiatName = 'Peso';
    } else if (fiat == 'NOK') {
      fiatName = 'Krone';
    } else if (fiat == 'NZD') {
      fiatName = 'New Zeland Dollar';
    } else if (fiat == 'PLN') {
      fiatName = 'Polish Zloty';
    } else if (fiat == 'RON') {
      fiatName = 'Romanian Leu';
    } else if (fiat == 'RUB') {
      fiatName = 'Ruble';
    } else if (fiat == 'SEK') {
      fiatName = 'Swedish Krona';
    } else if (fiat == 'SGD') {
      fiatName = 'Singapore Dollar';
    } else if (fiat == 'USD') {
      fiatName = 'US Dollar';
    } else if (fiat == 'ZAR') {
      fiatName = 'Rand';
    }
    return Text(
      '$fiatName',
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  },
).toList();

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const List<String> kCurrenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

String addParams(List paramsList) {
  String param = '';
  paramsList.forEach((fiat) {
    param += '$fiat,';
  });
  return param;
}

String api =
    'https://min-api.cryptocompare.com/data/pricemulti?fsyms=${addParams(kCurrenciesList)}&tsyms=${addParams(cryptoList)}&api_key=';
const String apiKey =
    'bf6595bcb4e7084aa0228031e51c0b848c316b6857a848b73f7700ee6ba381b7';
