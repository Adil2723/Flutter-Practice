import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 50,
            ),

            const SizedBox(height: 15),

            // Username
            const Text(
              "Your Username",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Profile Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Column(
                  children: [
                    Text(
                      "0",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Posts"),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      "0",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Followers"),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      "0",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Following"),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Edit Profile
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Edit Profile"),
              ),
            ),

            const SizedBox(height: 20),

            // Posts will be added later
            const Expanded(
              child: Center(
                child: Text(
                  "Your Posts",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
