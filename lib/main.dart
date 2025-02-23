import 'package:flutter/material.dart';
import 'package:quize_app/layouts/questions_screen.dart';
import 'package:quize_app/layouts/quiz_intro_screen.dart';
import 'package:quize_app/layouts/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.blue
              ])
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'IntroScreen',
        routes:{
          'IntroScreen' : (context) =>   const QuizIntroScreen(),
          'questions' : (context) =>   const QuestionsScreen(),
          'result' : (context) =>   const ResultScreen(),
        },
      ),
    );
  }
}

