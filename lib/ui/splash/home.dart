import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 1,
          leading: Icon(Icons.arrow_back),
          title: Text("Star Bucks"),
        ),
      ),
    );
  }
}
