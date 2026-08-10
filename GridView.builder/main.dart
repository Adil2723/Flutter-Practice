import 'package:flutter/material.dart';

import 'pages/gridview.dart';

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
        "/": (context) =>  InputPage(),
      }
    );
  }
  }
