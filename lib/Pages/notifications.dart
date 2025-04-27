import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FFFF),
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color(0xFF164F4F),
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: 6, // Example
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.notifications_active, color: Color(0xFF164F4F)),
            title: Text('Notification ${index + 1}'),
            subtitle: Text('You have a new update.'),
            onTap: () {},
          );
        },
      ),
    );
  }
}
