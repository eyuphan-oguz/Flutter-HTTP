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
  @override
  void initState() {
    super.initState();
    getJsonPlaceHolderDatas();

  }

  Future<PostData> getJsonPlaceHolderDatas() async {
    final _response =
    await http.get( Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

    final _mapJson = json.decode(_response.body);
    var post = PostData.fromJson(_mapJson);

    return post;
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
    future: getJsonPlaceHolderDatas(),
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
