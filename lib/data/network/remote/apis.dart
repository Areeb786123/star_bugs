import 'dart:convert';

import 'package:star_bugs_ui/data/models/response/posts.dart';
import 'package:star_bugs_ui/data/network/remote/api_manager.dart';
import 'package:star_bugs_ui/data/network/remote/end_points.dart';

class Api {
  Future<PostList> getAllPosts() async {
    try {

      print("vishal");
      var jsonStr = await ApiManager()
          .getApiCalls(endPoints: EndPoints.BASE_URL + EndPoints.ALL_POSTS);

      final json = jsonDecode(jsonStr); // Decode the JSON string

      print("hello$json");

      if (json is List) {
        return PostList.fromJson(json);
      } else {
        throw Exception('API response is not a valid list.');
      }

      PostList response = PostList.fromJson(json);

      return response;
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
  }
}
