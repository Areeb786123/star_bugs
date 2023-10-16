import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:star_bugs_ui/controllers/home_controllers.dart';
import 'package:star_bugs_ui/ui/coffee/coffee.dart';

import '../../data/models/response/posts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<Home> {
  int _currentIndex = 0;
  List<Post>? _post;

  void loadData() async {
    _post = await HomeController().getAllPosts();
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 1,
          leading: const Icon(Icons.arrow_back),
          title: const Text("Star Bucks"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /**
               * Banner card
               *
               */
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('asset/images/home_coffee.png'),
                  ),
                ),
              ),
              /**
               * card Balance
               * */
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Card(
                        child: SafeArea(
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Card Balance",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                                Text(
                                  "rs190.00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 14),
                              child: Divider(
                                height: 1,
                                color: Colors.black,
                              )),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset(
                                "asset/images/app_image.png",
                                width: 80,
                                height: 80,
                              ),
                              Image.asset(
                                "asset/images/app_image.png",
                                width: 80,
                                height: 80,
                              ),
                              Image.asset(
                                "asset/images/app_image.png",
                                width: 80,
                                height: 80,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                  )),
              const SizedBox(height: 14),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: const Text(
                      "Explore",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              /*
              * list of items
              * */
              const SizedBox(height: 14),
              _post == null
                  ? const CircularProgressIndicator()
                  : renderExploreList(_post!),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              navigationDirection(index);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee),
              label: "",
              backgroundColor: Colors.brown,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
              backgroundColor: Colors.teal,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "",
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget renderExploreList(List<Post> post) {
    log("Areeb $post");
    if (post.isNotEmpty) {
      return SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: post.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                child: Text(
                  post[index].title.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            }),
      );
    } else {
      return emptyData();
    }
  }

  Widget emptyData() {
    return SizedBox(
      width: double.infinity,
      child: Image.asset('asset/images/no_internet.png'),
    );
  }

  void navigationDirection(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Coffee()));
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }
}
