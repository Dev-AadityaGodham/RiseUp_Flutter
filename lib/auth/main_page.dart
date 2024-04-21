// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in/auth/auth_page.dart';
import 'package:log_in/pages/bottomnavigation.dart';
import 'package:log_in/pages/home_page.dart';
import 'package:log_in/pages/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder:(context,snapshot){
        if (snapshot.hasData) {
          return BottomPage();
        }else{
          return AuthPage();
        }
      }, ),
    );
  }
}