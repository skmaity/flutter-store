import 'package:animated_login/onboarding_screen.dart';
import 'package:animated_login/pages/dash_board.dart';
import 'package:animated_login/pages/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        initialData: FirebaseAuth.instance.currentUser,
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Check if user is authenticated
          if (snapshot.hasData) {
            return const DashBoard();
          } else {
            // Check if it's the first time entering the app
            if (snapshot.connectionState == ConnectionState.active) {
              // If it's the first time, navigate to OnBoard page
              return const LoginOrRegister();
            } else {
              // If user logged out, navigate to LoginOrRegister page
              return const LoginOrRegister();
            }
          }
        },
      ),
    );
  }
}
