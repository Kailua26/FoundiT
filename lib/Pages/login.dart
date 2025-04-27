import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home.dart';
import 'package:flutter_application_1/Pages/signup.dart';
import '/database/db_helper.dart'; // <-- important import

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showMessage('Please fill all fields.');
      return;
    }

    final dbHelper = DatabaseHelper();
    final user = await dbHelper.getUser(email, password);

    if (user != null) {
      // Login success
      _showMessage('Login Successful!', isSuccess: true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Login failed
      _showMessage('Invalid Email or Password');
    }
  }

  void _showMessage(String message, {bool isSuccess = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFE7F9F0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.png', height: 250, width: 250),
                      const SizedBox(height: 40),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Welcome!',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF4A8F6E),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Email TextField
                            TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Color(0xFFADAEBC)),
                                fillColor: Color(0xFFF5FDF9),
                                filled: true,
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xFFADAEBC),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFCFFAE2),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Password TextField
                            TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Color(0xFFADAEBC)),
                                fillColor: Color(0xFFF5FDF9),
                                filled: true,
                                suffixIcon: Icon(
                                  Icons.visibility,
                                  color: Color(0xFFADAEBC),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFCFFAE2),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 3),

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // You can handle forgot password feature here
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Color(0xFF8CD4A5)),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFACF7C1),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              onPressed: _login,
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF4A8F6E),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'or',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/google_logo.png',
                                height: 24,
                                width: 24,
                              ),
                              label: const Text(
                                'Login with Google',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                minimumSize: const Size(double.infinity, 50),
                              ),
                            ),

                            const SizedBox(height: 10),

                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/facebook_logo.png',
                                height: 24,
                                width: 24,
                              ),
                              label: const Text(
                                'Login with Facebook',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1877F2),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                minimumSize: const Size(double.infinity, 50),
                              ),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't Have An Account? ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "SIGNUP",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF4A8F6E),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
