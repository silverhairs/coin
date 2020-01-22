import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './utilities.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selectedValue = 'USD';
  String selectedCrypto = 'BTC';
  var currencyValue;
  var exchangeData;

  Future<dynamic> getExchangeData() async {
    http.Response response = await http.get(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/short?crypto=$selectedCrypto&fiat=$selectedValue');
    if (response.statusCode == 200) {
      var exchangeData = jsonDecode(response.body);
      setState(() {
        currencyValue = exchangeData['$selectedCrypto$selectedValue']['last']
            .toStringAsFixed(1);
      });
      return exchangeData;
    } else {
      return response.statusCode;
    }
  }

  @override
  void initState() {
    getExchangeData();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        DropdownButton(
                          value: selectedCrypto,
                          items: cryptoList.map((crypto) {
                            return DropdownMenuItem(
                              child: Text(
                                crypto,
                                style: TextStyle(color: Colors.white),
                              ),
                              value: crypto,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCrypto = value;
                              getExchangeData();
                            });
                            print(value);
                          },
                        ),
                        DropdownButton(
                          value: selectedValue,
                          items: currenciesList.map((currency) {
                            return DropdownMenuItem(
                              child: Text(
                                currency,
                                style: TextStyle(color: Colors.white),
                              ),
                              value: currency,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                              getExchangeData();
                            });
                            print(value);
                          },
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        '${currencyValue} $selectedValue',
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
