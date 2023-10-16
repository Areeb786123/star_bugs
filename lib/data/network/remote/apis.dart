import 'dart:developer';

import 'package:star_bugs_ui/data/models/response/coffeeModel.dart';
import 'package:star_bugs_ui/data/models/response/posts.dart';
import 'package:star_bugs_ui/data/network/remote/api_manager.dart';
import 'package:star_bugs_ui/data/network/remote/end_points.dart';

class Api {
  Future<PostList> getPostList() async {
    PostList postList = PostList(posts: []);
    try {
      print("ApiX  123");
      dynamic data = await ApiManager()
          .getAllPosts(endPoints: EndPoints.BASE_URL + EndPoints.ALL_POSTS);
      // log(data.runtimeType.toString());
      postList = PostList.fromJson(data);
      return postList;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<coffeeModel>> getCoffeeData() async {
    try {
      List<coffeeModel> coffeeList = [];
      var json = await ApiManager()
          .getCoffeeData(endPoints: EndPoints.BASE_URL + EndPoints.ALL_POSTS);
      if (json is List) {
        // Check if the JSON data is a list
        coffeeList = json.map((item) => coffeeModel.fromJson(item)).toList();
        // Now, coffeeList contains a list of coffeeModel instances
        print("Coffee List: ${coffeeList.length}");

      } else {
        print("JSON data is not a list");
      }
      return coffeeList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
