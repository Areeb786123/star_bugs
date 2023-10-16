import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_bugs_ui/controllers/coffee_controller.dart';
import 'package:star_bugs_ui/data/models/response/coffeeModel.dart';
import 'package:star_bugs_ui/data/network/remote/api_manager.dart';
import 'package:star_bugs_ui/data/network/remote/apis.dart';
import 'package:star_bugs_ui/data/network/remote/end_points.dart';
import 'package:star_bugs_ui/ui/common/base.dart';

import '../../data/models/response/posts.dart';
import '../home/home.dart';

class Coffee extends StatelessWidget {
  const Coffee({super.key});

  @override
  Widget build(BuildContext context) {
    var data = CoffeeController().coffeeList;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: MaterialApp(
        home: showCoffeeList(data),
      ),
    );
  }

  Widget getData(List<coffeeModel> post) {
    print("coffeeScreen    ${post.length}");
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: post.length,
          itemBuilder: (context, index) {
            return Card(
              child: Text(post[index].title.toString(),
                  style: const TextStyle(
                    color: Colors.blue,
                  )),
            );
          }),
    );
  }

  Widget showCoffeeList(List<coffeeModel> post) {
    if (post.isEmpty) {
      return Base.emptyData();
    } else {
      return getData(post);
    }
  }
}
