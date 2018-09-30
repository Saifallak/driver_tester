import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String greeting ="";

  @override
  void initState() {
    super.initState();
    getJson();
  }

  getJson() async {
    String apiUrl = 'https://paul-hammant.github.io/json_doc/hi.json';

    http.Response response = await http.get(apiUrl);

    var decoded = json.decode(response.body);

    setState(() {
      greeting = decoded["greeting"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Text(greeting),
      ),
    );
  }
}
