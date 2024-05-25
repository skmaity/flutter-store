import 'package:animated_login/pages/login.dart';
import 'package:animated_login/pages/register.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
 bool showLoginPage = true;
togglePage(){
  setState(() {
    showLoginPage = !showLoginPage;
  });
}
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onPressed: togglePage,
      );
    }
    else{
      return RegisterPage(
        onPressed: togglePage,
      );
    }
  }
}