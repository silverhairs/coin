import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  Result({
    @required this.resultValue,
    @required this.currency,
  });

  final resultValue;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: resultValue == null
          ? SpinKitPouringHourglass(
              size: 45,
              color: Colors.white,
            )
          : Text(
              '$resultValue $currency',
              style: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
