import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BumbleLoginPage extends StatefulWidget {
  @override
  _BumbleLoginPageState createState() => _BumbleLoginPageState();
}

class _BumbleLoginPageState extends State<BumbleLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;

  Future<void> _validateLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');

    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == savedUsername && password == savedPassword) {
      Navigator.pushNamed(context, '/home'); // Navigate to Home
    } else {
      setState(() {
        errorMessage = "Username or password is wrong";
      });
    }
  }

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
                SizedBox(height: 100, child: FlutterLogo()), // Placeholder logo
                SizedBox(height: 20),
                Text("Welcome to Bumble", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.amber[700])),
                SizedBox(height: 10),
                Text("Login to find your match!", style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                SizedBox(height: 40),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 10),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    _validateLogin(context); // Validate login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[700],
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text("Login", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: Text("Forgot Password?", style: TextStyle(color: Colors.amber[700])),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
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
