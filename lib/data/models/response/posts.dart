class Post {
  String? title;
  String? url;
  Post({this.title, this.url});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      url: json['url'],
    );
  }
}

class PostList {
  List<Post> posts;
  PostList({required this.posts});
  factory PostList.fromJson(List<dynamic> jsonList) {
    List<Post> postList = jsonList.map((json) {
      // Assuming your JSON has a "title" and "url" keys for each item.......
      print("rehman123 ${Post.fromJson(json)}");
      return Post.fromJson(json);
    }).toList();
    return PostList(posts: postList);
  }
}