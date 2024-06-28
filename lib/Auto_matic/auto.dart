import 'dart:convert';

import 'package:bitcoin_api_integration/Auto_matic/auto_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainApi_Two extends StatefulWidget {
  const MainApi_Two({super.key});

  @override
  State<MainApi_Two> createState() => _MainApi_TwoState();
}

List<PostsModel> postList = [];

class _MainApi_TwoState extends State<MainApi_Two> {
  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    // print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(postList[1].body);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Api work asif taj')),
      ),
      body: FutureBuilder(
          future: getPostApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('loading');
            } else {
              return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(postList[index].title.toString()),
                        Text(postList[index].userId.toString()),
                      ],
                    );
                  });
            }
          }),
    );
  }
}
