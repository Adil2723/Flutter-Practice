import "package:flutter/material.dart";

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final _formKey = GlobalKey<FormState>();

  final otpController = TextEditingController();

  String verifyMessage = "";

  void verifyOtp() {
    setState(() {
      verifyMessage = "OTP Verified Successfully!";
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Receive the email sent from Forgot Password Page
    final String email =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
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

                  const Icon(
                    Icons.verified_user,
                    size: 90,
                    color: Colors.deepPurple,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "OTP sent to\n$email",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 30),

                  TextFormField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,

                    decoration: const InputDecoration(
                      labelText: "Enter OTP",
                      hintText: "123456",
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {

                      if (value == null || value.isEmpty) {
                        return "OTP is required";
                      }

                      if (value.length != 6) {
                        return "OTP must contain exactly 6 digits";
                      }

                      if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                        return "OTP must contain only numbers";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {

                        if (_formKey.currentState!.validate()) {

                          verifyOtp();

                          Navigator.pushNamed(
                            context,
                            "/reset",
                            arguments: email,
                          );

                        }

                      },

                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "Verify OTP",
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
                    verifyMessage,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      // Later Firebase will resend OTP
                    },
                    child: const Text("Resend OTP"),
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
