import 'dart:convert';

import 'package:bitcoin_api_integration/API_Integration/model_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BitcoinIntegrationMain extends StatefulWidget {
  const BitcoinIntegrationMain({super.key});

  @override
  State<BitcoinIntegrationMain> createState() => _BitcoinIntegrationMainState();
}

class _BitcoinIntegrationMainState extends State<BitcoinIntegrationMain> {
  Map? data;
  Future<BitCoinModel> fetchData() async {
    BitCoinModel bm;
    String url = "https://api.coindesk.com/v1/bpi/currentprice.json";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonresponce = json.decode(response.body);
    data = jsonresponce['time'];
    bm = BitCoinModel.fromJson(jsonresponce);
    return bm;
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Center(child: Text(" Bitcoin Api Integration"))),
        body: FutureBuilder(
            future: fetchData(),
            builder: (c, s) {
              return Column(
                children: [
                  card_method("${s.data!.time.updated}"),
                  card_method("${s.data!.disclaimer}"),
                  Text(
                    'TODAY BIT COINS RATE',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  card_method("EURO: ${s.data!.bpi.EUR.rate}"),
                  card_method("GPG: ${s.data!.bpi.GBP.rate}"),
                  card_method("USD: ${s.data!.bpi.USD.rate}"),
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
