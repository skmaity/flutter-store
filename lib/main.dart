import 'package:animated_login/onboarding_screen.dart';
import 'package:animated_login/pages/auth_page.dart';
import 'package:animated_login/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'JosefinSans',
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,

      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'JosefinSans',
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: const CheckState(),
    );
  }
}

class CheckState extends StatefulWidget {
  const CheckState({super.key});

  @override
  State<CheckState> createState() => _CheckStateState();
}

class _CheckStateState extends State<CheckState> {
  Future<bool> _islogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool('login') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: 
    _islogin(),
     builder: (context, snapshot) {
      if(snapshot.hasData){
      return snapshot.data! ? AuthPage() : OnBoard();

      }
      else{
        return SizedBox();
      }
     },);
    
    
  }
}
