import 'package:bitcoin_api_integration/Api_Without_Model/apimain.dart';
import 'package:bitcoin_api_integration/Api_part_1/api_part_1.dart';
import 'package:bitcoin_api_integration/Auto_matic/auto.dart';
import 'package:bitcoin_api_integration/Manual_Model_Work/maodel_manual.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ApiWithoutModel(),
    );
  }
}
