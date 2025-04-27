import 'package:flutter/material.dart';

class MyPostsPage extends StatelessWidget {
  const MyPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Posts'),
        backgroundColor: Color(0xFF164F4F),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFFF5FFFF),
      body: ListView.builder(
        itemCount: 5, // Example only
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.image, color: Color(0xFF164F4F)),
            title: Text('Item ${index + 1}'),
            subtitle: Text('Description of item ${index + 1}'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          );
        },
      ),
    );
  }
}
