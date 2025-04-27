import 'dart:async';
import 'package:flutter/material.dart';
import 'signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignupPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD7F5DF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, size: 50, color: Color(0xFF164F4F)),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'F',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF164F4F),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'oundi',
                    style: TextStyle(fontSize: 40, color: Color(0xFF164F4F)),
                  ),
                  TextSpan(
                    text: 'T',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF164F4F),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'GUSION TECH',
              style: TextStyle(
                fontSize: 10,
                letterSpacing: 1,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Lost it? Found it!',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(color: Color(0xFF164F4F), strokeWidth: 3),
          ],
        ),
      ),
    );
  }
}
