import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:httpexample/model/post.dart';
import 'package:http/http.dart'as http;

class JsonPlaceHolderView extends StatefulWidget {
  const JsonPlaceHolderView({Key? key}) : super(key: key);

  @override
  State<JsonPlaceHolderView> createState() => _JsonPlaceHolderViewState();
}

class _JsonPlaceHolderViewState extends State<JsonPlaceHolderView> {



    Future<PostData> fetchPostData() async {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return PostData.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load PostData');
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:_placeHolderDatasWidget
        ),
      ),
    );
  }

  Widget get _placeHolderDatasWidget => FutureBuilder<PostData>(
    future: fetchPostData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListTile(
          title: Text(snapshot.data!.title.toString()),
          subtitle: Text(snapshot.data!.title.toString()),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}
