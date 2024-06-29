import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ManyalApiWork extends StatefulWidget {
  const ManyalApiWork({super.key});

  @override
  State<ManyalApiWork> createState() => _ManyalApiWorkState();
}

class _ManyalApiWorkState extends State<ManyalApiWork> {
  List<Photos> photoList = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      var datav = jsonDecode(response.body.toString());
      List<Photos> tempPhotoList = [];
      for (var i in datav) {
        Photos photos = Photos(title: i['title'], url: i['url']);
        tempPhotoList.add(photos);
      }
      return tempPhotoList;
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Api Works')),
      ),
      body: FutureBuilder<List<Photos>>(
        future: getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            photoList = snapshot.data!;
            return ListView.builder(
              itemCount: photoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    children: [
                      Text(photoList[index].title),
                      // Image.network(photoList[index].url),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Photos {
  String title, url;
  Photos({required this.title, required this.url});
}
