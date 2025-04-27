import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final String query;

  const SearchResultsPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FFFF),
      appBar: AppBar(
        title: Text('Search Results'),
        backgroundColor: Color(0xFF164F4F),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Results for "$query"', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Example
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: Icon(Icons.search, color: Color(0xFF164F4F)),
                      title: Text('Item ${index + 1}'),
                      subtitle: Text('Location: Sample Place'),
                      onTap: () {
                        // Navigate to item details if needed
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
