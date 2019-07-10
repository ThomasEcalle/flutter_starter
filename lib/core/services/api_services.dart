import 'dart:convert';

import 'package:flutter_model/core/models/navigation/exceptions/exceptions.dart';
import 'package:flutter_model/core/models/post.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const BASE_URL = "https://jsonplaceholder.typicode.com";

  static Future<List<Post>> getAllPosts() async {
    final response = await http.get("$BASE_URL/posts");
    if (response.statusCode != 200) {
      throw ServerError();
    }

    final jsonBody = json.decode(response.body);
    final List<Post> posts = [];
    posts.addAll((jsonBody as List).map((post) => Post.fromJson(post)).toList());

    return posts;
  }
}
