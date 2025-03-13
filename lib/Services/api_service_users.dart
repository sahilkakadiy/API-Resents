// api_service_users.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rest_api/Models/users_model.dart';

Future<List<User>> getUsersApi() async {
  List<User> usersList = [];
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    for (Map<String, dynamic> i in data) {
      usersList.add(User.fromJson(i)); // Add each user to the list
    }
    return usersList;
  } else {
    throw Exception('Failed to load users'); // If error occurs
  }
}
