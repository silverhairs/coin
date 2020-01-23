import 'dart:convert';
import 'package:http/http.dart' as http;

class ExchangeData {
  Future<dynamic> getExchangeData(String crypto, String physical) async {
    http.Response response = await http.get(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/short?crypto=$crypto&fiat=$physical');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return response.statusCode;
    }
  }
}
