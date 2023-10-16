import 'dart:developer';

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
}
