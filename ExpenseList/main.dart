import 'package:flutter/material.dart';

import 'pages/input_page.dart';
import 'pages/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Listing App",

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      initialRoute: "/",

      routes: {
        "/": (context) => const InputPage(),
        "/display": (context) => const ResultPage(),
      }
    );
  }
  }
