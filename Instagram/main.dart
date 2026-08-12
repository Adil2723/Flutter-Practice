import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/message_page.dart';
import 'pages/profile_page.dart';
import 'pages/reel_page.dart';
import 'pages/explore_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Dark Theme
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          foregroundColor: Colors.white,
        ),
      ),

      // Routes
      initialRoute: '/',
      routes: {
        '/': (context) =>  InstagramPage(),
        'dm': (context) => const MessagePage(),
        'profile': (context) => const ProfilePage(),
        'reels': (context) => const ReelPage(),
        'search': (context) => const MessagePage(),
      },
    );
  }
}
