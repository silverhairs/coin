import 'package:flutter/material.dart';
import '../components/exchange_data.dart';
import '../components/result.dart';
import '../components/currencies_selector.dart';
import '../utilities.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selectedValue = 'USD';
  String selectedCrypto = 'BTC';
  var currencyValue;
  var exchangeData;

  Future getExchange() async {
    exchangeData =
        await ExchangeData().getExchangeData(selectedCrypto, selectedValue);
    setState(() {
      currencyValue = exchangeData['$selectedCrypto$selectedValue']['last']
          .toStringAsFixed(1);
    });
    return exchangeData;
  }

  @override
  void initState() {
    getExchange();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Currency Converter'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 350,
            width: double.infinity,
            child: Card(
              color: Colors.purple,
              elevation: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CurrenciesSelector(
                      cryptoCurrencies: cryptoList,
                      physicalCurrencies: currenciesList,
                      selectedCrypto: selectedCrypto,
                      selectedValue: selectedValue,
                      resultHandler: (value) {
                        setState(() {
                          selectedCrypto = value;
                          getExchange();
                        });
                        print(value);
                      },
                    ),
                    Result(
                      resultValue: currencyValue,
                      currency: selectedValue,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

