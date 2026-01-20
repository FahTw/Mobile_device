import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostApi {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  static Future<List<Post>> fetchPost() async {
    final url = Uri.parse("$_baseUrl/posts");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load posts  (status code: ${response.statusCode})',
      );
    }

    final List<dynamic> data = json.decode(response.body) as List<dynamic>;
    return data
        .map((json) => Post.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static Future<Post> fetchPostDetail(int id) async {
    final uri = Uri.parse("$_baseUrl/posts/$id");
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load post detail (status code: ${response.statusCode})',
      );
    }

    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    return Post.fromJson(data);
  }
}
