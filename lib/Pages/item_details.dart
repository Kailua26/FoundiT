import 'package:flutter/material.dart';

class ItemDetailsPage extends StatelessWidget {
  final String itemName;
  final String description;

  const ItemDetailsPage({super.key, required this.itemName, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
        backgroundColor: Color(0xFF164F4F),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFFF5FFFF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(itemName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(description, style: TextStyle(fontSize: 16)),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA3F7BF),
                foregroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Contact Owner'),
            ),
          ],
        ),
      ),
    );
  }
}
