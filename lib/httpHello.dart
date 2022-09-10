import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class HttpHelloView extends StatefulWidget {
  const HttpHelloView({Key? key}) : super(key: key);

  @override
  State<HttpHelloView> createState() => _HttpHelloViewState();
}

class _HttpHelloViewState extends State<HttpHelloView> {

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getApiJohnName()async{
     return  (await http.get(Uri.parse('https://hwasampleapi.firebaseio.com/api/books/0/author.json'))).body;


     // data=json.decode(data);
     // setState(() {
     //   isHaveData=!isHaveData;
     //   this.data=data;
     // });
  }

  @override
  Widget build(BuildContext context) {
    // var columnCenter = Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         isHaveData? CircularProgressIndicator():Text(this.data),
    //         ElevatedButton(onPressed: ()async{
    //           await getApiJohnName();
    //         }, child: Text('Send Request'))
    //       ],
    //     ),
    //   );
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getApiJohnName(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done){
                if(snapshot.hasData){
                  return Text(json.decode(snapshot.data));
                }else{
                  return Text('You have error. Look at API');
                }
            }
            else if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else{
              return Text('You have error? Are you sure API?');
            }
          },
        ),
      ),
    );
  }
}
