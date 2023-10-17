import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:star_bugs_ui/controllers/coffee_controller.dart';
import 'package:star_bugs_ui/data/models/response/coffeeModel.dart';
import 'package:star_bugs_ui/data/network/remote/api_manager.dart';
import 'package:star_bugs_ui/data/network/remote/apis.dart';
import 'package:star_bugs_ui/data/network/remote/end_points.dart';
import 'package:star_bugs_ui/ui/common/base.dart';

import '../../data/models/response/posts.dart';
import '../home/home.dart';

class Coffee extends StatefulWidget {
  const Coffee({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Coffee();
  }
}

class _Coffee extends State<Coffee> {
  final CoffeeController coffeeController = Get.put(CoffeeController());

  // final CoffeeController coffeeController = Get.find<CoffeeController>();

  @override
  void initState() {
    coffeeController.getCoffeeDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        home: Obx(() {
          if (coffeeController.coffeeList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return getData(coffeeController.coffeeList);
          }
        }),
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
    // if (post.isEmpty) {
    //   return const  Center(child: CircularProgressIndicator());
    // } else {
    return getData(post);
    // }
  }
}
