import 'package:animated_login/pages/dash_board.dart';
// import 'package:animated_login/pages/login.dart';
import 'package:animated_login/pages/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context, snapshot) {
         if(snapshot.hasData){
          return const DashBoard();

         }
         else{
          return const LoginOrRegister();
         }
       },),
    );
  }
}