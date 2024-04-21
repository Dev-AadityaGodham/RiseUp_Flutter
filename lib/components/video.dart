// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class VideoTile extends StatelessWidget {
  final logoSub;
  final String mainTitle;
  final String subTitle;
  final percentage;

  const VideoTile(
      {super.key,
      required this.logoSub,
      required this.mainTitle,
      required this.subTitle,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.blue.shade300, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      logoSub,
                      color: Colors.white,
                      size: 30,
                    )),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainTitle,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ],
                ),
              ],
            ),
            CircularPercentIndicator(
              radius: 30,
              lineWidth: 10,
              percent: percentage,
              progressColor: Colors.blue,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              circularStrokeCap: CircularStrokeCap.round,
            )
          ]),
        ),
      ),
    );
  }
}
