import 'package:flutter/material.dart';
import 'package:quize_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/answers_btn.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsState();
}

List<String> selectedAnswer = [];

class _QuestionsState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;


  void chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length){
      setState(() {
        Navigator.pushNamed(context, 'result');
        print(selectedAnswer);
        currentQuestionIndex = 0;
      });
    }
  }

  void switchQuestion(){
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
             currentQuestion.question,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              decoration: TextDecoration.none,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 25,),

          ...currentQuestion.getShuffledAnswers().map((e){
            return  answerBTN(answerTxt: e, onPressed: (){
              switchQuestion();
              chooseAnswer(e);
            });
          }),

        ],
      ),
    );
  }
}
