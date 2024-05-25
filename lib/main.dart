import 'package:animated_login/components/auth_page.dart';
import 'package:animated_login/firebase_options.dart';
import 'package:animated_login/onboarding_screen.dart';
import 'package:animated_login/pages/dash_board.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.black))),
        fontFamily: 'JosefinSans',
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}
class CheckState extends StatefulWidget {
  const CheckState({super.key});

  @override
  State<CheckState> createState() => _CheckStateState();
}

class _CheckStateState extends State<CheckState> {
  @override
  void initState() {
    whereToGo();
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  whereToGo() async {
    var pref = await SharedPreferences.getInstance();
    bool? isLogin = pref.getBool('islogin');

    if (isLogin != null) {
      if (isLogin) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashBoard()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const OnBoard()));
      }
    }
    else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const OnBoard()));
    }
  } 
}
