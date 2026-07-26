import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String loginMessage = "";

  void successLogin() {
    setState(() {
      loginMessage = "Successfully Logged In!";
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),

            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.lock_open,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Sign in to continue",
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 30),

                  TextFormField(
                    controller: emailController,

                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "abc@gmail.com",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }

                      if (!value.contains("@")) {
                        return "Enter a valid email";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: passwordController,
                    obscureText: true,

                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }

                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }

                      return null;
                    },
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/forgot");
                      },
                      child: const Text("Forgot Password?"),
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          successLogin();
                        }
                      },

                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    loginMessage,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text(
                        "Don't have an account?",
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: const Text("Sign Up"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
