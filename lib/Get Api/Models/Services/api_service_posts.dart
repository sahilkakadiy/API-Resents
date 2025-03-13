import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rest_api/Models/posts_model.dart';

// Function to fetch posts from the API
Future<List<Post>> fetchPosts() async {
  List<Post> posts = [];
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    // If the server returned a 200 OK response,
    // then parse the JSON.
    var data = jsonDecode(response.body);
    for (Map<String, dynamic> i in data) {
      posts.add(Post.fromJson(i));
    }
    return posts;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load posts');
  }
}
