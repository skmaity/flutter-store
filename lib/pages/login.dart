import 'package:animated_login/components/auth_services.dart';
import 'package:animated_login/components/mybutton.dart';
import 'package:animated_login/components/mytextfield.dart';
import 'package:animated_login/components/square_tile.dart';
import 'package:animated_login/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onPressed;
  const LoginPage({
    super.key,
    required this.onPressed,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  // error message

  showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  void _pop() {
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

  void signUserIn() async {
    // show loading
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoard(),));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);

      _pop();
    } on FirebaseAuthException catch (e) {
      _pop();
      // wrong email message
      showMessage(e.code);
    }
  }

  googleSignIn() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    // try {
    //   Authservices().signInWithGoogle();
    //   _pop();

    // } catch (e) {
    //   print(e);
    //   _pop();
    // }

    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      auth.signInWithProvider(googleAuthProvider);
      _pop();
    } on FirebaseAuthException catch (e) {
      _pop();
      showMessage(e.code);
    }
  }

  facebookSignIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      final UserCredential usercredential = await Authservices().signInWithFacebook();
      if(context.mounted){
        print(usercredential.user!.displayName!);
      }

      // Authservices().signInWithFacebook();
      _pop();
    } catch (e) {
      showMessage(e.toString());
      _pop();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                "Welcome back you've been missed!",
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              // text filds
              MyTextField(
                controller: emailcontroller,
                hinttext: 'username',
                obsecuretext: false,
              ),
              const SizedBox(height: 40),

              MyTextField(
                controller: passwordcontroller,
                hinttext: 'password',
                obsecuretext: true,
              ),
              const SizedBox(height: 10),
              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password',
                          style: TextStyle(color: Colors.grey[600]),
                        )),
                  ],
                ),
              ),

              // signUp button

              const SizedBox(
                height: 25,
              ),
              MyButton(
                onTap: signUserIn,
                myText: 'Sign in',
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
                      onTap: googleSignIn,
                      imagePath: 'lib/assets/google_logo.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  SquareTile(
                      onTap: facebookSignIn,
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
                    'Not a memeber?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  TextButton(
                    onPressed: widget.onPressed,
                    child: const Text(
                      'Register now',
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
