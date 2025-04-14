import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nike/Screens/splash_screen.dart'; // or your starting screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // or any initial screen
    );
  }
}
