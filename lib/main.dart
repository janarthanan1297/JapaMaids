import 'package:flutter/material.dart';
import 'package:japamaids/layouts/doula_list.dart';
import 'package:japamaids/layouts/find.dart';
import 'package:japamaids/layouts/home.dart';
import 'package:japamaids/layouts/map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
