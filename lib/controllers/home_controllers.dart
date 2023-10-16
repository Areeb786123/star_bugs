import 'dart:developer';

import 'package:star_bugs_ui/data/models/response/posts.dart';
import 'package:star_bugs_ui/data/network/remote/apis.dart';

class HomeController {
  List<Post> postList = [];

  Future<List<Post>> getAllPosts() async {
    PostList value = await Api().getPostList();
    postList = value.posts;
    return postList;
    // log(postList.length.toString());
  }
}
