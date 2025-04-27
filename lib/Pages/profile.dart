import 'package:flutter/material.dart';
import 'messages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTab = 0; // 0 = My Posts, 1 = Pinned, 2 = Settings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Sarah Anderson',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 4),
            const Text('@sarahanderson', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton("My Posts", 0),
                _buildTabButton("Pinned", 1),
                _buildTabButton("Settings", 2),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                color: Colors.white, // White background for the content
                child: _buildTabContent(),
              ),
            ),
          ],
        ),
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
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MessagesPage()),
                  );
                },
                child: Image.asset(
                  'assets/icons/Message.png',
                  width: 24,
                  height: 24,
                ),
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
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedTab = index;
        });
      },
      style: TextButton.styleFrom(
        backgroundColor:
            selectedTab == index ? Colors.white : Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selectedTab == index ? Colors.black : Colors.grey,
          fontWeight:
              selectedTab == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    if (selectedTab == 0) {
      return ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          postCard(
            title: 'Found a black wallet near Naga Cathedral...',
            time: '12 hours ago',
            responses: 21,
            views: 30,
            tag: 'FOUND',
            tagColor: Color(0xFFA3F7BF),
          ),
          postCard(
            title: 'Lost a Folder near SM Naga City...',
            time: '7 days ago',
            responses: 40,
            views: 330,
            tag: 'LOST',
            tagColor: Color(0xFFFFA8A8),
          ),
        ],
      );
    } else if (selectedTab == 1) {
      return Center(
        child: Text(
          "Pinned Items",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    } else if (selectedTab == 2) {
      return Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Settings",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // Add other settings options here if needed
                const SizedBox(height: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the LoginPage
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(
                  double.infinity,
                  50,
                ), // Full width button
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Container();
  }

  Widget postCard({
    required String title,
    required String time,
    required int responses,
    required int views,
    required String tag,
    required Color tagColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: tagColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.forum_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                "$responses responses",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(width: 16),
              Icon(Icons.remove_red_eye_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                "$views views",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const Spacer(),
              Icon(Icons.star_border, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
