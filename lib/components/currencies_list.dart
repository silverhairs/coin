import 'package:currency_translate/constants.dart';
import 'package:flutter/material.dart';

class CurrenciesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fiatList.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.cyan),
                    borderRadius: BorderRadius.circular(30)),
                child: CircleAvatar(
                  radius: 60,
                  child: Text(
                    '${fiatLogos[index]}',
                    style: Theme.of(context).textTheme.title,
                  ),
                  backgroundColor: CoinColors.bluredDarkBlue,
                ),
              ),
              title: Text(
                '${fiatList.values.toList()[index]}',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: Colors.blueGrey),
              ),
            ),
            Divider(color: Color(0xFF182A56), thickness: .65)
          ],
        );
      },
    );
  }
}

// ListTile(

//           subtitle: Text(
//             '\$12356789',
//             style: Theme.of(context)
//                 .textTheme
//                 .display1
//                 .copyWith(color: Colors.white),
//           ),
//         ),
