import 'package:animated_login/components/otp_form.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          SizedBox(height: 100,),
          OtpForm()
        ],),
      
      ),
    );
  }
}