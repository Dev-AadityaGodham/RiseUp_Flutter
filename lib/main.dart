// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:log_in/auth/main_page.dart';
import 'package:log_in/pages/login_page.dart';
import 'package:log_in/pages/onboarding_screen.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBBIHBJYrIVqJ1brQJaSw2nDFC8wFUcCs0",
      appId: "1:824889863052:android:5f79a278a67efc6b5304a9",
      messagingSenderId: "824889863052",
      projectId: "auth-c9a4e",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}