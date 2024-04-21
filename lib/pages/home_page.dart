// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:log_in/components/video.dart';
import 'package:log_in/pages/drawer.dart';
import 'package:log_in/pages/ngo_page.dart';
import 'package:log_in/screens.dart/setting_page.dart';
import 'package:log_in/screens/quiz_screen.dart';
import 'package:log_in/pages/sub_videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade500,
        
        title: Text('Hello '  '${FirebaseAuth.instance.currentUser?.email?.split('@').first}'.toUpperCase(),style:TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20,
        ) ,),
      
      ),
      backgroundColor: Color.fromARGB(255, 105, 182, 245),
      body: SafeArea(
        child: Column(
          children: [
            
            //greeting row
            Padding(
              padding: const EdgeInsets.only(bottom:10,top:10,left:10,right:10),
              child: Column(
                children: [
                  Container(
                width:MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/background11.png"),
                      fit: BoxFit.cover,
                    )),
              ),
              Text("Welcome To RiseUp",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white,shadows: [
                  Shadow(
                    // Adding a shadow to the text
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  ),
                ],
              ),),
              Text("Explore a World of Knowledge, Anytime, Anywhere. Start Your Learning Journey Today!",textAlign: TextAlign.center,style: TextStyle(
                color: Colors.white,
                fontSize: 17
              ),),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NGOPage(title: 'Ngo Information',)));
                            },
                            child:Container(
                                padding: EdgeInsets.only(left:20,right:20,top:12,bottom:12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.person_pin_circle,
                                      size: 30,
                                      color: Colors.blue,
                                    ),
                                    Text("Ngo",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => QuizScreen()));
                            },
                            child: Container(
                                padding: EdgeInsets.only(left:20,right:20,top:12,bottom:12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.quiz_rounded,
                                      size: 30,
                                      color: Colors.blue,
                                    ),
                                    Text("Quiz",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)
                                  ],
                                )),
                          ),
                         
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SettingPage()));
                            },
                            child: Container(
                                padding: EdgeInsets.only(left:20,right:20,top:12,bottom:12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.blue,
                                    ),
                                    Text("Me",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                height: 100,
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recently Watch Videos!",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.more_horiz)
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            VideoTile(
                              logoSub: Icons.video_collection,
                              mainTitle: "Introduction To Science",
                              subTitle: "Science",
                              percentage: 0.5,
                            ),
                            VideoTile(
                              logoSub: Icons.backup_table_sharp,
                              mainTitle: "Introduction To DBMS",
                              subTitle: "DBMS",
                              percentage: 0.2,
                            ),
                            VideoTile(
                              logoSub: Icons.video_collection,
                              mainTitle: "Evolution Of Humans",
                              subTitle: "science",
                              percentage: 0.8,
                            ),
                            VideoTile(
                              logoSub: Icons.data_object_outlined,
                              mainTitle: "Materix Multiplicatioon",
                              subTitle: "Math",
                              percentage: 0.1,
                            ),
                            VideoTile(
                              logoSub: Icons.person,
                              mainTitle: "Moon & Sun",
                              subTitle: "English",
                              percentage: 0.9,
                            ),
                            VideoTile(
                              logoSub: Icons.person,
                              mainTitle: "Introduction To Blockchain",
                              subTitle: "Blockchain",
                              percentage: 0.5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
