import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quize_app/data/questions.dart';
import 'package:quize_app/layouts/questions_screen.dart';

class ResultScreen extends StatefulWidget {
   ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreen();
}


getSummaryData (){
  final List<Map<String,dynamic>> summary=[];
  for (var i=0 ; i < selectedAnswer.length ; i++){
    summary.add({
      'question_index' : i,
      'question' : questions[i].question,
      'correct_answer' : questions[i].answers[0],
      'user_answer' : selectedAnswer[i]
    });
  }
  return summary;
}



class _ResultScreen extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    int numberOfCorrectAnswers = summaryData.where(
        (e) => e['correct_answer'] ==e['user_answer']
    ).length;

    // for(var i = 0 ; i < summaryData.length ; i++){
    //     if(summaryData[i]['correct_answer'] == summaryData[i]['user_answer']){
    //       numberOfCorrectAnswers++;
    //     }
    // }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered correct $numberOfCorrectAnswers questions of ${questions.length} ',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              decoration: TextDecoration.none
            ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 500,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...getSummaryData().map((e){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor:  e['correct_answer'] == e['user_answer'] ? Colors.deepPurple[900] :  Colors.red ,
                                  child: Text(
                                    ((e['question_index'] as int)+1).toString(),
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        color: Colors.white,
                                        decoration: TextDecoration.none
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['question'].toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.white,
                                            decoration: TextDecoration.none
                                        ),
                                      ),
                                      Text(
                                        e['correct_answer'].toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.green,
                                            decoration: TextDecoration.none
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        e['user_answer'].toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: e['correct_answer'] == e['user_answer'] ? Colors.black45 : Colors.redAccent,
                                            decoration: TextDecoration.none
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                ),
                onPressed: () {
                  selectedAnswer = [];
                  Navigator.pushNamed(context, 'questions');
                },
                label: const Text("Restart Quiz"),
                icon: const Icon(Icons.repeat , color: Colors.white,)),
          ],
        ),
      ),
    );
  }
}
