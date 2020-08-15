import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyTechApp());
}
String osname;
String image;
class MyTechApp extends StatelessWidget {
  @override
  web(osname, image) async {
    var url = "http://192.168.43.171/cgi-bin/web.py?x=${ osname }&y=${ image }";
    var response = await http.get(url);
    print(response.body);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text("TechApp"),
        ), 
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                   osname = value;
                  },
                 autocorrect: false,
                 decoration: InputDecoration(
                 prefixIcon: Icon(Icons.adb),
                 hintText: "Enter Your OSName"
                 ),
                ),
        
                TextField(
                  onChanged: (value) {
                   image = value;
                  },
                 autocorrect: false,
                 decoration: InputDecoration(
                 prefixIcon: Icon(Icons.adb),
                 hintText: "Enter Your Image"
                 ),
                ),
                FlatButton(onPressed: () {
                  web(osname, image);
                }, child: Text("Click"))
              ],
            ),
          ),
        ),
        )
    );
  }
}
