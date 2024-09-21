import 'package:flutter/material.dart';
import 'home_page.dart'; // Import HomePage
import 'forgot_password_page.dart'; // Import ForgotPasswordPage
import 'sign_up_page.dart'; // Import SignUpPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bumble App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // Define routes
      routes: {
        '/': (context) => BumbleLoginPage(), // Main page (Login)
        '/forgot-password': (context) => ForgotPasswordPage(), // Forgot Password page
        '/sign-up': (context) => SignUpPage(), // Sign Up page
        '/home': (context) => HomePage(), // Home page
      },
      initialRoute: '/', // Default route when app starts
    );
  }
}

class BumbleLoginPage extends StatefulWidget {
  @override
  _BumbleLoginPageState createState() => _BumbleLoginPageState();
}

class _BumbleLoginPageState extends State<BumbleLoginPage> {
  // Controllers to capture username and password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variable to store error message
  String? errorMessage;

  // Function to validate the login credentials
  void _validateLogin(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == "arceus" && password == "namangupta") {
      // If credentials are correct, navigate to Home page
      Navigator.pushNamed(context, '/home');
    } else {
      // If credentials are incorrect, show error message
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
                  controller: _usernameController, // Attach controller
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController, // Attach controller
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 10),

                // Show error message if credentials are wrong
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Validate login credentials
                    _validateLogin(context);
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
