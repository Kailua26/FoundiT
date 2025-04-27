import 'package:flutter/material.dart';
import 'post_lost.dart';
import 'post_found.dart';
import 'messages.dart';
import 'profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final Color lightGreen = Color(0xFFA3F7BF);
  final Color darkGreen = Color(0xFF024D3D);
  final Color lightRed = Color(0xFFFFA8A8);

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Mary Grace Piattos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.notifications_none),
                  SizedBox(width: 10),
                  Icon(Icons.settings),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for lost or found items...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LostItemPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lightGreen,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text('+ Report Lost'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoundItemPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreen,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text('+ Found Item'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Recent Items',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    itemCard(
                      context,
                      title: 'Blue Bag',
                      description:
                          'Found at Dyd Hub, has 2 notebooks and a calculator inside',
                      location: 'Dayangdang St. Naga City',
                      time: '2h ago',
                      image: 'assets/Bag.png',
                      status: 'Found',
                      statusColor: lightGreen,
                    ),
                    itemCard(
                      context,
                      title: 'House Keys',
                      description:
                          'Lost near Daily Joe in Ateneo Ave, it has a labubu key chain',
                      location: 'Ateneo Ave., Bagumbayan Sur, Naga City',
                      time: '5h ago',
                      image: 'assets/Key.png',
                      status: 'Lost',
                      statusColor: lightRed,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
          borderRadius: BorderRadius.only(
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
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Image.asset(
                  'assets/icons/Profile.png',
                  width: 24,
                  height: 24,
                ),
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

  Widget itemCard(
    BuildContext context, {
    required String title,
    required String description,
    required String location,
    required String time,
    required String image,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, height: 60, width: 60, fit: BoxFit.cover),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(description, style: TextStyle(fontSize: 13)),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.location_on, size: 16, color: Colors.black54),
                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
