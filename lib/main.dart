import 'package:animated_login/pages/auth_page.dart';
import 'package:animated_login/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
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

      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'JosefinSans',
        useMaterial3: true,

      ),
      
      themeMode: ThemeMode.system,
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
