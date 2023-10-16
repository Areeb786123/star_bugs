import 'dart:convert';

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

  PostList.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = (json['posts'] as List).map((v) => Post.fromJson(v)).toList();
    }
  }
}
