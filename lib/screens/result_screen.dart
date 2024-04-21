// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

import '/models/questions.dart';
import '/screens/quiz_screen.dart';
import '/widgets/next_button.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 1000),
          
          const Text(
            'Your Score\n And Keep Going',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 15,
                  value: score / 9,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(
                    score.toString(),
                    style: const TextStyle(fontSize: 50,color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${(score / questions.length * 100).round()}%',
                    style: const TextStyle(fontSize: 25,color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          Lottie.network("https://lottie.host/cc350b41-a766-4150-9093-fb5ab6362a5f/8OkJDdFiq7.json"),
        ],
      ),
    );
  }
}