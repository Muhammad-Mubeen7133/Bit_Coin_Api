import 'dart:convert';

import 'package:bitcoin_api_integration/API_Integration/model_api.dart';
import 'package:bitcoin_api_integration/Manual_Model_Work/maodel_manual.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class BitcoinIntegrationMain extends StatefulWidget {
  const BitcoinIntegrationMain({super.key});

  @override
  State<BitcoinIntegrationMain> createState() => _BitcoinIntegrationMainState();
}

class _BitcoinIntegrationMainState extends State<BitcoinIntegrationMain> {
  // Map? data;
  // Future<BitCoinModel> fetchData() async {
  //   BitCoinModel bm;

  //   String url = "https://api.coindesk.com/v1/bpi/currentprice.json";

  //   http.Response response = await http.get(Uri.parse(url));

  //   Map<String, dynamic> jsonresponce = json.decode(response.body);

  //   data = jsonresponce['time'];

  //   bm = BitCoinModel.fromJson(jsonresponce);

  //   return bm;
  // }

  Future<Mubeen?> showMubData() async {
    var loadJson = await rootBundle.loadString('json/api.json');
    // ignore: non_constant_identifier_names
    Map<String, dynamic> JsonDecodeApna = await json.decode(loadJson);
    Mubeen m = Mubeen.fromJsomApnaMub(JsonDecodeApna);

    return m;
  }

  @override
  void initState() {
    // fetchData();
    showMubData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Center(child: Text(" Bitcoin Api Integration"))),
        body: FutureBuilder(
            // future: fetchData(),
            future: showMubData(),
            builder: (c, s) {
              if (!s.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  card_method("${s.data!.name}"),
                  card_method("${s.data!.time.updated}"),
                  card_method("${s.data!.chartName}"),
                  card_method("${s.data!.a.b.one}"),

                  // card_method("${s.data!.time.updated}"),
                  // card_method("${s.data!.disclaimer}"),
                  Text(
                    'TODAY BIT COINS RATE',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  // card_method("EURO: ${s.data!.bpi.EUR.rate}"),
                  // card_method("GPG: ${s.data!.bpi.GBP.rate}"),
                  // card_method("USD: ${s.data!.bpi.USD.rate}"),
                ],
              );
            }));
  }

  Card card_method(String text) {
    return Card(
      color: Colors.cyan,
      child: ListTile(
        title: Text(text),
      ),
    );
  }
}
