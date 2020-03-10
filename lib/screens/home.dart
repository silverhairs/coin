import 'package:currency_translate/components/currencies_list.dart';
import 'package:currency_translate/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Text> cryptoNames = cryptoList.values
      .map((fiat) =>
          Text('$fiat', style: TextStyle(fontSize: 20, color: Colors.white)))
      .toList();

  Map<String, dynamic> data;

  Future getData() async {
    http.Response response = await http.get('$api$apiKey');
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      data = jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
    print(data);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoinColors.bluredDarkBlue,
      extendBody: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Container(
              padding: EdgeInsets.only(top: 60, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Currencies',
                    style: Theme.of(context).textTheme.display1.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFF152B55),
                      child: Icon(Icons.more_horiz, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: CupertinoPicker(
              useMagnifier: false,
              backgroundColor: Color(0xFF152B55),
              children: cryptoNames,
              itemExtent: 35,
              onSelectedItemChanged: (index) {
                print(index);
              },
            ),
          ),
          Expanded(
            flex: 6,
            child: CurrenciesList(),
          ),
        ],
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  BottomNav({@required this.icon, @required this.title});
  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      height: 50,
      child: Column(
        children: <Widget>[
          this.icon,
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle,
          )
        ],
      ),
    );
  }
}
