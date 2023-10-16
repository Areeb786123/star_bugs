import 'dart:convert';
import 'dart:developer';

class Post {
  String? title;
  String? url;

  Post({this.title, this.url});

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    url = json['url'] ?? "";
  }
}

class PostList {
  List<Post> posts = [];

  PostList({required this.posts});

  PostList.fromJson(List<dynamic> json) {
    for (int i = 0; i < 10; i++) {
      log(json[0].toString());
      posts.add(Post.fromJson(json[i]));
    }
  }
}
