import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class HttpHelloView extends StatefulWidget {
  const HttpHelloView({Key? key}) : super(key: key);

  @override
  State<HttpHelloView> createState() => _HttpHelloViewState();
}

class _HttpHelloViewState extends State<HttpHelloView> {
   late bool isHaveData;
   late String data;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHaveData=false;
    data='';
  }

  Future getApiJohnName()async{
     var data= (await http.get(Uri.parse('https://hwasampleapi.firebaseio.com/api/books/0/author.json'))).body;
     data=json.decode(data);

     setState(() {
       isHaveData=!isHaveData;
       this.data=data;
     });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isHaveData? CircularProgressIndicator():Text(this.data),
            ElevatedButton(onPressed: ()async{
              await getApiJohnName();
            }, child: Text('Send Request'))
          ],
        ),
      ),
    );
  }
}
