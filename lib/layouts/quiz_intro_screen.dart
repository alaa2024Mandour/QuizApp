import 'package:flutter/material.dart';
class QuizIntroScreen extends StatelessWidget {
  const QuizIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
          mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 25,
            children: [
                  const Image(image: AssetImage('assets/quiz-logo.png'), width: 200,),
                  const Text(
                    'Start Learn Flutter Now !! ',
                    style: TextStyle(
                      color: Colors.white,
                        decoration: TextDecoration.none,
                      fontSize: 20
                    ),
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'questions');
                    },
                    label: const Text("Start Now"),
                  icon: const Icon(Icons.double_arrow_rounded , color: Colors.white,)),
            ],
          );
  }
}
