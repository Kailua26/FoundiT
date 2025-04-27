import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FFFF),
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Color(0xFF164F4F),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter your email to reset password:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA3F7BF),
                foregroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
