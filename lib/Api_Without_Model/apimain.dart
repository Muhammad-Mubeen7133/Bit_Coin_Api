import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiWithoutModel extends StatefulWidget {
  const ApiWithoutModel({super.key});

  @override
  State<ApiWithoutModel> createState() => _ApiWithoutModelState();
}

class _ApiWithoutModelState extends State<ApiWithoutModel> {
  var datavv;
  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      datavv = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
            child: Text('Api Work'),
          ),
        ),
        body: FutureBuilder(
            future: getUserApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading');
              }
              return ListView.builder(
                  itemCount: datavv.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Resclass(
                            title: 'name',
                            value: datavv[index]['name'].toString(),
                          ),
                          Resclass(
                            title: 'username',
                            value: datavv[index]['username'].toString(),
                          ),
                          Resclass(
                            title: 'address',
                            value:
                                datavv[index]['address']['street'].toString(),
                          ),
                        ],
                      ),
                    );
                  });
            }));
  }
}

class Resclass extends StatelessWidget {
  String title, value;
  Resclass({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
