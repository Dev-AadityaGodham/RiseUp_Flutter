// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NGOPage extends StatelessWidget {
  NGOPage({required this.title});

  final String title;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        content: Text(
                          "NGOs in Pune stand ready to offer support and assistance across various needs, serving as crucial resources for individuals seeking help and guidance. ",
                          style: TextStyle(fontSize: 16),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Ok",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      );
                    },
                  );
                },
                child: Icon(Icons.info)),
          )
        ], // Use the provided title
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. IDEA Foundation",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/ngo_img.jpg"),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Column(children: [
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.blue)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(6)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Map"),
                          onPressed: () {
                            final snackbar = SnackBar(
                              content: const Text("This is the NGO's way"),
                              action: SnackBarAction(
                                label: "Go",
                                onPressed: () {
                                  const link =
                                      "https://www.google.com/maps/search/18%2F2%2F6B,+B-4,+Chaitanya+Society,+Brahmachaitanya+Society+Lane,+Near+Ambedkar+Chowk,+Warje,+Pune+%E2%80%93+411058/@18.5077043,73.7997231,14z/data=!3m1!4b1?authuser=0&entry=ttu";
                                  launch(link);
                                },
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.blue)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(6)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Call"),
                          onPressed: () {
                            final snackbar = SnackBar(
                              content: const Text("Contact The Ngo"),
                              action: SnackBarAction(
                                label: "Call us",
                                onPressed: () {
                                  launch("tel:+91-9730257719");
                                },
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.blue)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(6)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Email"),
                          onPressed: () {
                            final snackbar = SnackBar(
                              content: const Text("Email Us"),
                              action: SnackBarAction(
                                label: "Email",
                                onPressed: () {
                                  const email = "contact@ideafoundation.org.in";
                                  launch("mailto:$email");
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                        ),
                      ])
                    ],
                  ),
                  Text(
                    "The IDEA Foundation is a non-profit organization dedicated to improving the lives of underprivileged communities across India. Founded in 2010, the organization focuses on providing education, healthcare, and livelihood opportunities to those in need.",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2. Shelter Associates",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.blue)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(6)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Map"),
                          onPressed: () {
                            final snackbar = SnackBar(
                              content: const Text("This is the NGO's way"),
                              action: SnackBarAction(
                                label: "Go",
                                onPressed: () {
                                  const link =
                                      "https://www.google.com/maps/search/A%2F17,+Sarasnagar+Siddhivinayak+Society,+Shukrawar+Peth,+Pune-411+002/@18.5001501,73.8524023,17z/data=!3m1!4b1?authuser=0&entry=ttu";
                                  launch(link);
                                },
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.blue)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(6)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Call"),
                          onPressed: () {
                            final snackbar = SnackBar(
                              content: const Text("Contact The Ngo"),
                              action: SnackBarAction(
                                label: "Call us",
                                onPressed: () {
                                  launch("tel:020 2444 0363");
                                },
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.blue)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(6)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Email"),
                          onPressed: () {
                            final snackbar = SnackBar(
                              content: const Text("Email Us"),
                              action: SnackBarAction(
                                label: "Email",
                                onPressed: () {
                                  const email = "info@shelter-associates.org";
                                  launch("mailto:$email");
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 300,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/ngo_img2.jpg"),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                  Text(
                    "Shelter Associates is a non-profit organization based in Pune, India, that works towards providing secure and dignified housing for the urban poor. Their approach is unique in that they use technology and community mobilization to create a comprehensive database of slum households, their needs, and their willingness to contribute to upgrading their living conditions.",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              SizedBox(
                        height: 10,
                      ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3.Sevavardhini",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/ngo_img3.jpg"),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Column(children: [
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.blue)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(6)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Map"),
                          onPressed: () {
                            final snackbar = SnackBar(
                              content: const Text("This is the NGO's way"),
                              action: SnackBarAction(
                                label: "Go",
                                onPressed: () {
                                  const link =
                                      "https://www.google.com/maps/search/390B,+Narayan+Peth,+Dattadham,+Rashtrabhasha+Bhavan+lane,+Pune+411030/@18.5148839,73.8465204,17z/data=!3m1!4b1?authuser=0&entry=ttu";
                                  launch(link);
                                },
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.blue)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(6)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Call"),
                          onPressed: () {
                            final snackbar = SnackBar(
                              content: const Text("Contact The Ngo"),
                              action: SnackBarAction(
                                label: "Call us",
                                onPressed: () {
                                  launch("tel:24499606");
                                },
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                        ),
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.blue)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(6)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text("Email"),
                          onPressed: () {
                            final snackbar = SnackBar(
                              content: const Text("Email Us"),
                              action: SnackBarAction(
                                label: "Email",
                                onPressed: () {
                                  const email = "contact@sevavardhini.org";
                                  launch("mailto:$email");
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                        ),
                      ])
                    ],
                  ),
                  Text(
                    "Sevavardhini is a non-profit organization based in Pune, India, which focuses on the empowerment of women, children, and marginalized communities. The organization was founded in 1998 with the goal of creating sustainable and inclusive development in rural and urban areas.",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
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
