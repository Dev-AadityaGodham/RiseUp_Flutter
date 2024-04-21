// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:log_in/screens/result_screen.dart';

import '/models/questions.dart';
import '/screens/result_screen.dart';
import '/widgets/answer_card.dart';
import '/widgets/next_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: const Text('Quiz',style: TextStyle(
          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25
        ),),
      ),
      body: Container(
        decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.white.withOpacity(0.8), Color.fromARGB(255, 0, 207, 234),Color.fromARGB(255, 251, 251, 252)],
              )),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                question.question,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: selectedAnswerIndex == null
                        ? () => pickAnswer(index)
                        : null,
                    child: AnswerCard(
                      currentIndex: index,
                      question: question.options[index],
                      isSelected: selectedAnswerIndex == index,
                      selectedAnswerIndex: selectedAnswerIndex,
                      correctAnswerIndex: question.correctAnswerIndex,
                    ),
                  );
                },
              ),
              // Next Button
              isLastQuestion
                  ? RectangularButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => ResultScreen(
                              score: score,
                            ),
                          ),
                        );
                      },
                      label: 'Finish',
                    )
                  : RectangularButton(
                      onPressed:
                          selectedAnswerIndex != null ? goToNextQuestion : null,
                      label: 'Next',
                    ),
            ],
          ),
        ),
      ),
    );
  }
}