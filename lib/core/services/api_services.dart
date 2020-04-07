import 'dart:convert';

import 'package:cleyade/core/models/navigation/exceptions/exceptions.dart';
import 'package:cleyade/core/models/post.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<Post>> getAllPosts() async {
    final response = await http.get('$baseUrl/posts');
    if (response.statusCode != 200) {
      throw ServerError();
    }

    final List jsonBody = json.decode(response.body) as List;
    final List<Post> posts = [];

    posts.addAll(jsonBody.map((dynamic post) {
      return Post.fromJson(post as Map<String, dynamic>);
    }).toList());

    return posts;
  }

  static Future<bool> hasToken() async {
    await Future<void>.delayed(Duration(seconds: 3));
    return false;
  }

  static Future<bool> persistToken(String token) async {
    await Future<void>.delayed(Duration(seconds: 1));
    return false;
  }

  static Future<void> clearTokens() async {
    await Future<void>.delayed(Duration(seconds: 1));
    return;
  }

  static Future<String> login(String userName, String password) async {
    await Future<void>.delayed(Duration(seconds: 1));
    return 'token';
  }
}
