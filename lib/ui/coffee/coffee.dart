import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:star_bugs_ui/controllers/coffee_controller.dart';
import 'package:star_bugs_ui/data/models/response/coffeeModel.dart';
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
        backgroundColor: Colors.brown,
        title: const Center(
          child: Text(
            "Coffee Menu",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
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
            return getList(post, index);
          }),
    );
  }

  Widget getList(List<coffeeModel> post, int index) {
    return Card(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Center(
            child: Text(post[index].title.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                )),
          ),
        ),
      ),
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
