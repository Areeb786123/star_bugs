import 'dart:developer';

import 'package:get/get.dart';
import 'package:star_bugs_ui/data/models/response/posts.dart';
import 'package:star_bugs_ui/data/network/remote/apis.dart';

class HomeController extends GetxController {
  RxList<Post> postList = <Post>[].obs;

  Future<void> getAllPosts() async {
    PostList value = await Api().getPostList();
    postList.clear();
    for (int i = 0; i < 10; i++) {
      postList.add(value.posts[i]);
    }
    update();
    // log(postList.length.toString());
  }
}
