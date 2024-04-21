// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_required_param, unused_import

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:log_in/pages/book.dart';
import 'package:log_in/pages/home_page.dart';
import 'package:log_in/pages/sub_videos.dart';

import 'package:log_in/screens.dart/setting_page.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {

  //method to change the index
  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  //the pages form 0 to 4
 int _selectedIndex = 0;
  // the pages we have in our app
  final List _pages = [
    HomePage(),
    heartPage(),
    bookPage(),
    SettingPage(), 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index:_selectedIndex,
        backgroundColor: Colors.white,
        color: Colors.blue,
        animationDuration: Duration(milliseconds: 300),
        onTap: _navigateBottomBar,
        items: [
        Icon(Icons.home,color: Colors.white,),
        Icon(Icons.slow_motion_video_outlined,color: Colors.white),
        Icon(Icons.bookmark,color: Colors.white),
        Icon(Icons.person,color: Colors.white),
      ]),
    );
  }
}