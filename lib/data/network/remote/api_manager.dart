import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiManager {
   static Map EmptyJson = {};
  Future<dynamic> getApiCalls({required String endPoints}) async {
    var responseJson = EmptyJson;

    Uri urlForPost = Uri.parse(endPoints);
    try {
      final response = await http.get(urlForPost);
      return handleResponse(response);
      // Add this line to return the parsed JSON
    } catch (e) {
      throw Exception(e);
    }
  }

  dynamic handleResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 500 :
        print("Api error");
    }
  }
}


