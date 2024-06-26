import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(startQuiz: startQuiz);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
          resetQuiz: resetQuiz,
        );
      });
    }
  }

  void resetQuiz() {
    setState(
      () {
        selectedAnswers = [];
        activeScreen = StartScreen(startQuiz: startQuiz);
      },
    );
  }

  void startQuiz() {
    setState(
      () {
        activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
      },
    );
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Colors.orange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
