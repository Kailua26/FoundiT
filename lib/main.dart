import 'package:flutter/material.dart';
import 'pages/splash.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/home.dart';
import 'pages/post_lost.dart';
import 'pages/post_found.dart';
import 'pages/item_details.dart';
import 'pages/my_posts.dart';
import 'pages/profile.dart';
import 'pages/messages.dart';
import 'pages/settings.dart';
import 'pages/forgot_password.dart';
import 'pages/search_results.dart';
import 'pages/notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoundiT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF024D3D), // your green theme
        fontFamily: 'Roboto', // or any font you use
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => HomePage(),
        '/post_lost': (context) => LostItemPage(),
        '/post_found': (context) => FoundItemPage(),
        '/item_details':
            (context) => ItemDetailsPage(
              itemName: 'Sample Item',
              description: 'Sample Description',
            ),
        '/my_posts': (context) => MyPostsPage(),
        '/profile': (context) => ProfilePage(),
        '/messages': (context) => MessagesPage(),
        '/settings': (context) => SettingsPage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/search_results':
            (context) => SearchResultsPage(query: 'default query'),
        '/notifications': (context) => NotificationsPage(),
      },
    );
  }
}
