// ignore_for_file: prefer_const_constructors, prefer_final_fields, override_on_non_overriding_member, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:log_in/auth/main_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  PageController _controller = PageController();

  //to keep track if we on last page or not
  bool onLastPage = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.white.withOpacity(0.8), Color.fromARGB(255, 0, 207, 234),Color.fromARGB(255, 251, 251, 252)],
              )),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = index == 2;
                });
              },
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         Colors.blue.shade800,
                  //         Colors.blue.withOpacity(0.9),
                  //         Colors.white.withOpacity(0.9),
                  //       ],
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.bottomRight,
                  //     )
                  //   ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.network("https://lottie.host/10fc272f-59d0-4bd2-8f6c-ff105cc244d6/NPkUflVug1.json"),
                        SizedBox(height: 20),
                        Text("Ready to unlock your brilliance?\nOur educational app offers tailored lessons to help you shine.",textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 18,
                        ),),
                      ],
                    ),
                  ),
                ),
                Container(
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         Colors.blue.shade800,
                  //         Colors.blue.withOpacity(0.9),
                  //         Colors.white.withOpacity(0.9),
                  //       ],
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.bottomRight,
                  //     )
                  //   ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Play and learn",textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 25,
                          
                        ),),
                        SizedBox(height: 20),
                        Lottie.network("https://lottie.host/60e443ae-8502-4832-9dad-1c89cc049843/XddSYUwH6D.json"),
                        SizedBox(height: 20),
                        Text("Dive into interactive activities and discover the joy of lifelong learning.",textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 18,
                        ),),
                      ],
                    ),
                  ),
                ),
                Container(
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         Colors.blue.shade800,
                  //         Colors.blue.withOpacity(0.9),
                  //         Colors.white.withOpacity(0.9),
                  //       ],
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.bottomRight,
                  //     )
                  //   ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Get ready to learn in a whole new way! Dive into our educational app for personalized learning experiences",textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 18,
                        ),),
                        SizedBox(height: 20),
                        
                        Lottie.network("https://lottie.host/ad97aa37-fb19-48dc-bf7f-3a9e4f7beae4/jH0gLQ8u4n.json"),
                        SizedBox(height: 20),
                        Text("Discover endless knowledge\nat your fingertips",textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 18,
                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment(0, .8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //left button
                      GestureDetector(
                          onTap: () {
                            _controller.jumpToPage(2);
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                ),
                          )),
                      SmoothPageIndicator(controller: _controller, count: 3),
                      //right button
                      onLastPage
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => MainPage()));
                              },
                              child: Text(
                                "Done",
                                style: TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                    ),
                              ))
                          : GestureDetector(
                            onTap: () {
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                    ),
                              ))
                    ])),
          ],
        ),
      ),
    );
  }
}
