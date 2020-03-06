import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() => runApp(Coin());

class Coin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'SanFrancisco',
      ),
      home: Home(),
    );
  }
}
