import 'package:flutter/material.dart';
import 'package:rest_api/PostApi/Screens/register_screen.dart';
import 'package:rest_api/Screens/Homepage2.dart';
import 'package:rest_api/Screens/product_screen.dart';

import 'Screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest Api Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductScreen(),
    );
  }
}
