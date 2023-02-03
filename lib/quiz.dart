import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz(
      {@required this.answerQuestion,
      @required this.questions,
      @required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionIndex]['questionText']
          as String), // As string is written to convine dart that it will be a string and nothing else
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          //three dots are used to concatenate two lists
          .map((answer) {
        //map runs for each value of question list and changes the widgets we see on the screen
        return Answer(() => answerQuestion(answer['score']), answer['text']);
      }).toList()
    ]);
  }
}
