import 'package:flutter/material.dart';

Widget answerBTN ({
  required String answerTxt,
  required Function onPressed,
}) =>  Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0),
  child: ElevatedButton(
    onPressed:(){
      onPressed();
    },
    style: ElevatedButton.styleFrom(
        foregroundColor:Colors.white ,
        backgroundColor: Colors.deepPurple[900],
        padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
    ),
    child: Text(
      answerTxt,
      textAlign: TextAlign.center,
    ),
  ),
);