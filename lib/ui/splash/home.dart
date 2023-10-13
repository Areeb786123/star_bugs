import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }

}


class _HomeScreen extends State<Home> {
  int _currentIndex = 0;
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
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
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
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Explore",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
              /*
              * list of items
              * */
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            print(index);
            setState(() {
              _currentIndex = index;

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

  void navigationDirection(int index ) {
    switch (index) {
      case 0  : break;
      case 1 : break ;
      case 2 : break;
      case 3 :break ;
    }
  }

}
