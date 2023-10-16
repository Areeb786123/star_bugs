import 'package:star_bugs_ui/data/models/response/posts.dart';
import 'package:star_bugs_ui/data/network/remote/apis.dart';

class HomeController {
  List<Post>  post = [];
  List<Post> getAllposts() {
    Api().getAllPosts().then((value) {
      for (int i = 0; i <= value.posts.length - 1; i++) {
        post.add(value.posts[i]);
        print(value.posts[i]);
      }
    });
    return post;
  }
}
