import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiManager {
  Future<dynamic> getAllPosts({required String endPoints}) async {
    Uri uri = Uri.parse(endPoints);
    var responseJson = {};
    try {
      final response = await http.get(uri);
      log("API MANAGER 1");
      // responseJson = handleUri(response);
      log("API MANAGER 2");

      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  dynamic handleUri(http.Response response) {
    // print("responseObj $response");
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        log("response.body");
        // log(response.body);
        return responseJson;
      default:
        throw Exception("Some error occur with the Api");
    }
  }
}
