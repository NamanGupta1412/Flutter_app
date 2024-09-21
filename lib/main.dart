import 'package:flutter/material.dart';
import 'forgot_password_page.dart'; // Import the Forgot Password Page
import 'sign_up_page.dart'; // Import the Sign Up Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bumble Login',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // Define routes
      routes: {
        '/': (context) => BumbleLoginPage(), // Main page (Login)
        '/forgot-password': (context) => ForgotPasswordPage(), // Forgot Password page
        '/sign-up': (context) => SignUpPage(), // Sign Up page
      },
      initialRoute: '/',
    );
  }
}

class BumbleLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 100, child: FlutterLogo()), // Placeholder logo
                SizedBox(height: 20),
                Text("Welcome to Bumble", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.amber[700])),
                SizedBox(height: 10),
                Text("Login to find your match!", style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                SizedBox(height: 40),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Email', prefixIcon: Icon(Icons.email))),
                SizedBox(height: 20),
                TextField(obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password', prefixIcon: Icon(Icons.lock))),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Add login functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[700],
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text("Login", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 20),

                // Forgot Password Link
                TextButton(
                  onPressed: () {
                    // Navigate to Forgot Password Page
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: Text("Forgot Password?", style: TextStyle(color: Colors.amber[700])),
                ),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Sign Up Page
                        Navigator.pushNamed(context, '/sign-up');
                      },
                      child: Text("Sign Up", style: TextStyle(color: Colors.amber[700], fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
