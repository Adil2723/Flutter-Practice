import 'package:flutter/material.dart';

class InstagramPage extends StatefulWidget {
  const InstagramPage({super.key});

  @override
  State<InstagramPage> createState() => _InstagramPageState();
}

class _InstagramPageState extends State<InstagramPage> {
  int selectedIndex = 0;

  final stories = [
    "Your Story",
    "Ali",
    "Ahmed",
    "Hamza",
    "Sara",
    "Hassan",
    "Bilal",
  ];

  final posts = [
    {
      "username": "Ali",
      "caption": "Beautiful day!",
      "likes": 120,
    },
    {
      "username": "Ahmed",
      "caption": "Great memories.",
      "likes": 245,
    },
    {
      "username": "Hamza",
      "caption": "Weekend vibes!",
      "likes": 89,
    },
    {
      "username": "Sara",
      "caption": "Enjoying the view.",
      "likes": 310,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.camera_alt),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          "Instagram",
          style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          letterSpacing: -1.2,
          color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),

      // Body
      body: Column(
        children: [
          // STORIES
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      // Your Story gets the + icon
                      index == 0
                          ? Stack(
                              children: [
                                const CircleAvatar(
                                  radius: 35,
                                ),

                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const CircleAvatar(
                              radius: 35,
                            ),

                      const SizedBox(height: 5),

                      Text(
                        stories[index],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(),

          // POSTS
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Post Header
                    ListTile(
                      leading: const CircleAvatar(),

                      title: Text(
                        posts[index]["username"] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Blank Post Area
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),

                    // Like / Comment / Share
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                          ),
                          onPressed: () {},
                        ),

                        IconButton(
                          icon: const Icon(
                            Icons.comment_outlined,
                          ),
                          onPressed: () {},
                        ),

                        IconButton(
                          icon: const Icon(
                            Icons.share_outlined,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    // Likes + Caption
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          // Likes
                          Text(
                            "${posts[index]["likes"]} likes",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          // Username + Caption
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      posts[index]["username"]
                                          as String,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),

                                TextSpan(
                                  text:
                                      " ${posts[index]["caption"]}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),

// Bottom Navigation
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: selectedIndex,
    backgroundColor: Colors.black,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    onTap: (index) {
      setState(() {
      if(index == 0){
        Navigator.pushReplacementNamed(context, '/home');
      } else if(index == 1){
        Navigator.pushReplacementNamed(context, '/reels');
      } else if(index == 2){
        Navigator.pushReplacementNamed(context, '/messages');
      } else if(index == 3){
        Navigator.pushReplacementNamed(context, '/search');
      } else if(index == 4){
        Navigator.pushReplacementNamed(context, '/profile');
      }
      });
  },
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.movie_outlined),
      activeIcon: Icon(Icons.movie),
      label: "Reels",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline),
      activeIcon: Icon(Icons.chat_bubble),
      label: "Messages",
      
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "Search",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: "Profile",

    ),
  ],
),
  );
  }
}
