// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:log_in/screens.dart/setting_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          //header

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue.shade500,
              ),
              accountName: Text("User"),
              accountEmail: Text('${FirebaseAuth.instance.currentUser?.email}',style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 18,
              ),),
            ),
          ),
          //listview
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingPage()));
            },
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            title: Text(
              "profile",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                FirebaseAuth.instance.signOut();
              });
            },
            leading: Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
