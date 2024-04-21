// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirm()) {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), password: _passwordController.text.trim()
      ); 

      //add user details
      addUserdetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        int.parse(_ageController.text.trim()),
      );
      
    }
  }

  Future addUserdetails(String firstName, String lastName, String email,int age) async{
    await FirebaseFirestore.instance.collection('user').add({
      'first name':firstName,
      'last name': lastName,
      'email':email,
      'age':age,
    });
  }

  bool passwordConfirm(){
    if (_passwordController.text.trim()==_confirmPasswordController.text.trim()) {
      return true;
      
    }else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hello There",
                      style: GoogleFonts.bebasNeue(
                          fontSize: 40, fontWeight: FontWeight.bold)),
                  Padding(
                  padding: const EdgeInsets.only(left:18,right: 18),
                  child: Container(
                  width:MediaQuery.of(context).size.width,
                  height: 174,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/images/lock_screen3.png"),
                        fit: BoxFit.cover,
                      )),
                              ),
                ),
                  
                  //hello text
                  
        
                  Text(
                    "Create Account Now!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //text fildes email
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            hintText: "First Name",
                            fillColor: Colors.white,
                            filled: true,
                          ))),
        
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: TextField(
                          
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            hintText: "Last Name",
                            fillColor: Colors.white,
                            filled: true,
                          ))),
        
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: TextField(
                          controller: _ageController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            hintText: "Age",
                            fillColor: Colors.white,
                            filled: true,
                          ))),
        
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
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
        
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            hintText: "Password",
                            fillColor: Colors.white,
                            filled: true,
                          ))),
                  SizedBox(
                    height: 15,
                  ),
                //confirm password      
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: TextField(
                          obscureText: true,
                          controller:_confirmPasswordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            hintText: "Confirm Password",
                            fillColor: Colors.white,
                            filled: true,
                          ))),
        
                  SizedBox(
                    height: 15,
                  ),
        
                  //signin buttom
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: GestureDetector(
                      onTap: signUp,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.black),
                        child: Center(
                            child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
        
                  //register email
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I am a Member!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
