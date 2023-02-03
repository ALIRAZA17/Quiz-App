//State should be used in a .dart file which is the parent of the other two

import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); // Because This function returns an object of the state class
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What is your favourite color",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': "What is your favourite animal",
      'answers': [
        {'text': 'Dog', 'score': 8},
        {'text': 'Rat', 'score': 10},
        {'text': 'Goat', 'score': 5},
        {'text': 'Cow', 'score': 3},
      ],
    },
    {
      'questionText': "Who is your favourite Instructor",
      'answers': [
        {'text': 'Ali', 'score': 8},
        {'text': 'Merry', 'score': 10},
        {'text': 'Usama', 'score': 5},
        {'text': 'Babar', 'score': 3},
      ]
    },
  ];
  //Added pointer to the main class
  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      // Set state re renders the build method of only that widget in which it is present
      _questionIndex += 1;
    });

    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
