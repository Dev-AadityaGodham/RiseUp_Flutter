// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:log_in/books/english_bookPage.dart';
import 'package:log_in/books/evs_bookPage.dart';
import 'package:log_in/books/hindi_bookPage.dart';
import 'package:log_in/books/marathi_bookPage.dart';
import 'package:log_in/books/math_bookPage.dart';


class bookPage extends StatefulWidget {
  const bookPage({super.key});

  @override
  State<bookPage> createState() => _bookPageState();
}

class _bookPageState extends State<bookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          
          Center(child: Text("info")),
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: GestureDetector(
  onTap: () {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            content: Text("Books will be get updated time to time",style: TextStyle(fontSize: 16),),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Ok",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
            ],
          );
        },
      );
  },
  child: Icon(Icons.info),
),

          ),
        ],
        title: Text("Book Section"),
        leading: Icon(Icons.library_books_rounded),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/book1.png"),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 350,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(.3),
                          Colors.blue.withOpacity(.2),
                          Colors.white.withOpacity(.3),
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.radio_button_checked_rounded),
                    Text(
                      "Reading: A Journey of \na Thousand Words.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 15, 61),
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.radio_button_checked_rounded),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:22.0,right:22.0),
                child: Text(
                    "Reading educational books is like feeding young minds with a nutritious diet.Reading educational books is like feeding young minds with a nutritious diet. Just as a balanced meal supports physical growth, educational books nourish children's intellectual development.",style: TextStyle(
                      
                      fontSize:18,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mathBookPage()));
                        },
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/book_cover3.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Text(
                        "Math",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>englishBookPage()));
                        },
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/book_cover3.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Text(
                        "English",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>marathiBookPage()));
                        },
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/book_cover3.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Text(
                        "Marathi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>hindiBookPage()));
                        },
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/book_cover3.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Text(
                        "Hindi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>evsBookPage()));
                        },
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/book_cover3.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Text(
                        "EVS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
