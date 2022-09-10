import 'package:flutter/material.dart';
import 'package:httpexample/httpHello.dart';
import 'package:httpexample/view/json_placeholder_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: JsonPlaceHolderView(),
    );
  }
}

