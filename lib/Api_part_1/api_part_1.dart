import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPart1HOme extends StatefulWidget {
  const ApiPart1HOme({super.key});

  @override
  State<ApiPart1HOme> createState() => _ApiPart1HOmeState();
}

class _ApiPart1HOmeState extends State<ApiPart1HOme> {
  Map<String, dynamic>? dataMap;
  // Map<String, dynamic>? doneDataMap;
  // Map<String, dynamic>? doneSupport;
  List<dynamic>? doneListData;
  Future fetchApi() async {
    http.Response response;
    response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    print(response.body.runtimeType);

    if (response.statusCode == 200) {
      setState(() {
        dataMap = jsonDecode(response.body);
        // doneSupport = dataMap!['supper'];
        // doneDataMap = dataMap!['data'];
        doneListData = dataMap!['data'];
        print(doneListData);
      });
    } else {
      print('000000000000000000000000000000 status code out');
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    print('Allah say apnay talooqat');
    // fetchApi();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Api works')),
      ),
      body: doneListData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: doneListData!.length,
              itemBuilder: (context, index) {
                final user = doneListData![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar']),
                  ),
                  subtitle: Text(user['email']),
                  title: Text('${user['first_name']} \n${user['last_name']}'),
                );
              },
            ),
    );
  }
}
