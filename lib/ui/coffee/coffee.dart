import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_bugs_ui/ui/common/base.dart';

import '../../data/models/response/posts.dart';
import '../home/home.dart';

class Coffee extends StatelessWidget {
  const Coffee({super.key});

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
        home: Base.emptyData(),
      ),
    );
  }

  Widget getData(List<Post> post) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: post.length,
          itemBuilder: (context, index) {
            return Card(child: Text(post[index].title.toString()));
          }),
    );
  }
}
