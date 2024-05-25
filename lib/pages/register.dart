import 'package:animated_login/components/mybutton.dart';
import 'package:animated_login/components/mytextfield.dart';
import 'package:animated_login/components/square_tile.dart';
import 'package:animated_login/pages/otp_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onPressed;
   const RegisterPage({super.key,required this.onPressed});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // controllers
  final TextEditingController email = TextEditingController();
 final TextEditingController password = TextEditingController();
 final TextEditingController ConfirmPassword = TextEditingController();


 showMessage(String message) {
    showDialog(context: context, builder: (context) {
      return  AlertDialog(
        title: Text(message),
      );
    },);
  }


   void _pop(){
      Navigator.pop(context);

}

    void newRegister() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPage(
              onPressed: widget.onPressed,
            ),
          ));
    }

    void signUserUp() async {
      // show loading
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
    
      try {
        if(password.text == ConfirmPassword.text)
        {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        }
        else{
          // show error message password dont match
          showMessage('Password dont match!');
        }
      
    
      _pop();

      } on FirebaseAuthException catch (e) {
        _pop();
        // wrong email message
       showMessage(e.code);
      }
    }
  @override
  Widget build(BuildContext context) {
    void getOtp() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpPage(),));
  }
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              const SizedBox(height: 40),
              Image.asset(
                'lib/assets/flutter_logo.png',
                scale: 140,
              ),
              const SizedBox(height: 40),
              //massage
              Text(
                "Let's create a new account!",
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              // text filds
              MyTextField(
                controller: email,
                hinttext: 'username',
                obsecuretext: false,
              ),
              const SizedBox(height: 10),

              MyTextField(
                controller: password,
                hinttext: 'password',
                obsecuretext: true,
              ),
              const SizedBox(height: 10),
                MyTextField(
                controller: ConfirmPassword,
                hinttext: 'confirm password',
                obsecuretext: false,
              ),
              const SizedBox(height: 40),
              // signUp button
              const SizedBox(
                height: 25,
              ),
              MyButton(
                onTap: signUserUp,
                myText: 'Sign up',
              ),

              // continue with
              const SizedBox(
                height: 40,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    onTap: () {
                      
                    },
                    imagePath: 'lib/assets/google_logo.png'),
                  SizedBox(
                    width: 10,
                  ),
                  SquareTile(
                    onTap: () {
                      
                    },
                    imagePath: 'lib/assets/facebook_logo.png'),
                ],
              ),
              const SizedBox(
                height: 40,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  TextButton(
                    onPressed: widget.onPressed,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}