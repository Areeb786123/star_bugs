import 'package:star_bugs_ui/data/models/response/posts.dart';
import 'package:star_bugs_ui/data/network/remote/apis.dart';

class HomeController {
  List<Post> postList = [];

  List<Post> getAllPosts() {
    Api().getPostList().then((value) {
      for (int i = 0; i <= value.posts.length - 1; i++) {
        print("home 123");
        print("home ${value.posts}");
        postList.add(value.posts[i]);
      }
    });

    return postList;
  }
}
