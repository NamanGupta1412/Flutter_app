import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Enter your email to reset your password",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Email TextField
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "Enter your registered email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            // Reset Password Button
            ElevatedButton(
              onPressed: () {
                // Add functionality to send password reset
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.amber[700], // Bumble theme color
              ),
              child: Text(
                "Send Reset Link",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            // Back to Login
            TextButton(
              onPressed: () {
                // Navigate back to Login page
                Navigator.pop(context);
              },
              child: Text(
                "Back to Login",
                style: TextStyle(color: Colors.amber[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
