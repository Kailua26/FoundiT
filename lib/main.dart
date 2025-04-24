import 'package:flutter/material.dart';
import 'dart:async';

// Pages
import 'Pages/home.dart';
import 'Pages/login.dart';
import 'Pages/signup.dart';
import 'Pages/postFoundItem.dart';
import 'Pages/postLostItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoundiT',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
      home: const SplashScreen(), // Start with splash screen
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => HomePage(),
        '/postFoundItem': (context) => LostItemPage(),
        '/postLostItem': (context) => FoundItemPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F5DF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 50, color: Color(0xFF164F4F)),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
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
            const Text(
              'GUSION TECH',
              style: TextStyle(
                fontSize: 10,
                letterSpacing: 1,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lost it? Found it!',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: Color(0xFF164F4F),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
