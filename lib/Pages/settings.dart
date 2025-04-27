import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FFFF),
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF164F4F),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: true,
            onChanged: (value) {},
            title: Text('Enable Notifications'),
          ),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            title: Text('Terms and Conditions'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
