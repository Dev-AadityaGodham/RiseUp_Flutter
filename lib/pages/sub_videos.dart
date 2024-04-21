// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:log_in/pages/video_info.dart';
import 'package:log_in/video_pages/english_page.dart';
import 'package:log_in/video_pages/evs_page.dart';
import 'package:log_in/video_pages/hindi_page.dart';
import 'package:log_in/video_pages/marathi_page.dart';
import 'package:log_in/video_pages/math_page.dart';


class heartPage extends StatefulWidget {
  const heartPage({super.key});

  @override
  State<heartPage> createState() => _heartPageState();
}

class _heartPageState extends State<heartPage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("assets/info.json")
        .then(((value) {
      setState(() {
        info = json.decode(value);
      });
    }));
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade800.withOpacity(1),
                                Colors.white.withOpacity(1)
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(80)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(5, 5),
                                blurRadius: 10,
                                color: Colors.blue.shade800.withOpacity(0.5)),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Watch New Videos",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "My learning \nLearn More by watching this videos",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text("60 min",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(3, 3),
                                              blurRadius: 5,
                                              color: Colors.black
                                                  .withOpacity(0.5)),
                                        ],
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => VideoInfo()));
                                        },
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 10,
                            color: Colors.blue.shade800.withOpacity(0.5)),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/card3.png"),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 250,
                          ),
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("assets/images/student1.png"),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 150),
                          width: double.maxFinite,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You are doing great",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "keep it up",
                                style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Stick to your plan",
                                style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Text(
                        "Subjects or Cources",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //1
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>English_page()));
                            });
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/s3.png'),
                                  fit: BoxFit.scaleDown),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 51, 115, 151)
                                        .withOpacity(1),
                                    Colors.white.withOpacity(1)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: Colors.blue.shade800.withOpacity(0.5)),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "English",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Math_page()));
                            });
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/s3.png'),
                                  fit: BoxFit.scaleDown),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 51, 115, 151)
                                        .withOpacity(1),
                                    Colors.white.withOpacity(1)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: Colors.blue.shade800.withOpacity(0.5)),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Math",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //1
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>hindi_page()));
                            });
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/s3.png'),
                                  fit: BoxFit.scaleDown),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 51, 115, 151)
                                        .withOpacity(1),
                                    Colors.white.withOpacity(1)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: Colors.blue.shade800.withOpacity(0.5)),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Hindi",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>marathi_page()));
                            });
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/s3.png'),
                                  fit: BoxFit.scaleDown),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 51, 115, 151)
                                        .withOpacity(1),
                                    Colors.white.withOpacity(1)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: Colors.blue.shade800.withOpacity(0.5)),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Marathi",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //1
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>evs_page()));
                            });
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/s3.png'),
                                  fit: BoxFit.scaleDown),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 51, 115, 151)
                                        .withOpacity(1),
                                    Colors.white.withOpacity(1)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: Colors.blue.shade800.withOpacity(0.5)),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "EVS",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
