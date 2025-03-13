import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> login(String email, String password, BuildContext context) async {
  try {
    final response = await http.post(
      Uri.parse("https://reqres.in/api/register"),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login successful!"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login failed: ${response.body}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error: ${e.toString()}"),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
