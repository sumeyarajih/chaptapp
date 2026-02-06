import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:polychat/screens/home.dart';
import 'package:polychat/auth/login.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.blue, // Adjust to match your theme
              ),
            ),
          );
        }
        
        if (snapshot.hasData && snapshot.data != null) {
          // User is logged in
          return HomePage();
        }
        
        // User is not logged in
        return LoginScreen();
      },
    );
  }
}