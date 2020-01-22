import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './homepage.dart';

void main() => runApp(Coin());

class Coin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        textTheme: ThemeData.dark().textTheme.copyWith(
              body1: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
      ),
    );
  }
}
