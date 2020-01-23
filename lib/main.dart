import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  return runApp(Coin());
}

class Coin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        textTheme: ThemeData.dark().textTheme.copyWith(
              body1: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
      ),
    );
  }
}
