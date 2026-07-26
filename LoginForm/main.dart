import 'package:flutter/material.dart';

import 'pages/signin_page.dart';
import 'pages/signup_page.dart';
import 'pages/forgot_password.dart';
import 'pages/verifyOTP_page.dart';
import 'pages/reset_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Authentication App",

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      initialRoute: "/",

      routes: {
        "/": (context) => const SignInPage(),
        "/signup": (context) => const SignUpPage(),
        "/forgot": (context) => const ForgotPasswordPage(),
        "/verify": (context) => const VerifyOtpPage(),
        "/reset": (context) => const ResetPasswordPage(),
      },
    );
  }
}
