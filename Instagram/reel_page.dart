import 'package:flutter/material.dart';

class ReelPage extends StatelessWidget {
  const ReelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reels"),
      ),

      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,

          child: const Center(
            child: Text(
              "Reel Content",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
