import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Messages",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search messages',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                messageTile(
                  context,
                  image: 'assets/user1.png',
                  name: 'Sarah Wilson',
                  message: 'Hey, are you available for a quick chat?',
                  time: '2:30 PM',
                  isNew: true,
                ),
                messageTile(
                  context,
                  image: 'assets/user2.png',
                  name: 'John Cooper',
                  message: 'Thanks for the update!',
                  time: 'Yesterday',
                ),
                messageTile(
                  context,
                  image: 'assets/user3.png',
                  name: 'Emma Davis',
                  message: 'The project files have been updated...',
                  time: 'Yesterday',
                  isNew: true,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 2, // Set the index for "Messages"
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamed(context, '/home'); // Navigate to Home
            } else if (index == 1) {
              Navigator.pushNamed(context, '/posts'); // Navigate to My Posts
            } else if (index == 3) {
              Navigator.pushNamed(context, '/profile'); // Navigate to Profile
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Home.png', width: 24, height: 24),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Post.png', width: 24, height: 24),
              label: "My Posts",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/Message.png',
                width: 24,
                height: 24,
              ),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/Profile.png',
                width: 24,
                height: 24,
              ),
              label: "Profile",
            ),
          ],
          selectedItemColor:
              Colors.green, // Set the selected item color to green
          unselectedItemColor:
              Colors.grey, // Set the unselected item color to grey
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  Widget messageTile(
    BuildContext context, {
    required String image,
    required String name,
    required String message,
    required String time,
    bool isNew = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(radius: 28, backgroundImage: AssetImage(image)),
              if (isNew)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: isNew ? Colors.green : Colors.black,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
