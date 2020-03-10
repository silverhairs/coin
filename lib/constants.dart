import 'package:flutter/material.dart';

class CoinColors {
  static Color darkBlue = Color(0xFF182A56);
  static Color bluredDarkBlue = Color(0xFF0D1E4C);
}

Map<String, String> fiatList = {
  'AUD': 'Australian Dollar',
  'BRL': 'Brazilian Real',
  'CAD': 'Canadian Dollar',
  'CNY': 'Chinese Yuan',
  'EUR': 'Euro',
  'GBP': 'GB Pound',
  'HKD': 'Hong Kong Dollar',
  'IDR': 'Indonesian Rupiah',
  'ILS': 'Israeli Shekel',
  'INR': 'Indian Rupee',
  'JPY': 'Japanese Yen',
  'MXN': 'Mexican Peso',
  'NOK': 'Norwegian Krone',
  'NZD': 'New Zeland Dollar',
  'PLN': 'Polish Zloty',
  'RON': 'Romanian Leu',
  'RUB': 'Russian Ruble',
  'SEK': 'Swedish Krona',
  'SGD': 'Singapore Dollar',
  'USD': 'US Dollar',
  'ZAR': 'South African Rand',
  'RWF': 'Rwandan Francs',
};

const Map<String, String> cryptoList = {
  'BTC': 'Bitcoin',
  'ETH': 'Etheurem',
  'LTC': 'Litecoin',
};

List<String> fiatLogos = fiatList.keys.toList();
List<String> cryptoLogos = cryptoList.keys.toList();


String addParams(List paramsList) {
  String param = '';
  paramsList.forEach((fiat) {
    param += '$fiat,';
  });
  return param;
}

String api =
    'https://min-api.cryptocompare.com/data/pricemulti?fsyms=${addParams(fiatLogos)}&tsyms=${addParams(cryptoLogos)}&api_key=';
const String apiKey =
    'bf6595bcb4e7084aa0228031e51c0b848c316b6857a848b73f7700ee6ba381b7';
