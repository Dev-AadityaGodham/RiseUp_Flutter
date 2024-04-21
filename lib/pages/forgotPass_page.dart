// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
        showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),),
            backgroundColor: Colors.amber.shade300,
            content: Text("Password reset link has been sent to your email!",style: TextStyle(fontSize: 16),),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Ok",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Back to the previous page"),
        elevation: 0,
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network("https://lottie.host/f03caf37-369a-4b78-949c-e7971650d3f6/rsM4ewY9lr.json"),
               SizedBox(
                height: 15,
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "Enter your email and we will send you a link",
                  style: TextStyle(fontSize: 16),
                ),
              )),
              SizedBox(
                height: 15,
              ),
               
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        hintText: "Email",
                        fillColor: Colors.white,
                        filled: true,
                      ))),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: passwordReset,
                child: Text(
                  "Reset Password",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
