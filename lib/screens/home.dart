import 'package:currency_translate/components/currencies_list.dart';
import 'package:currency_translate/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency_translate/components/search_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        color: CoinColors.darkBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(FontAwesomeIcons.sync, color: Colors.white),
            Icon(FontAwesomeIcons.chartLine, color: Colors.white),
            Icon(FontAwesomeIcons.coins, color: Colors.white),
            Icon(FontAwesomeIcons.angleDoubleRight, color: Colors.white),
          ],
        ),
      ),
      backgroundColor: CoinColors.bluredDarkBlue,
      extendBody: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:60, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Currencies',
                  style: Theme.of(context).textTheme.display1.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(right:10.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFF152B55),
                    child: Icon(Icons.more_horiz, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: SearchBar(),
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
