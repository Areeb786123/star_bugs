import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('asset/images/home_coffee.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
