import 'package:first_app/answer.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

//void main() => runApp(MyApp());

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  static const _questions = [
    {
      'questionText': "What is your fav color",
      'answers': [
        {'text': 'red', 'score': 6},
        {'text': 'blue', 'score': 5},
        {'text': 'black', 'score': 10},
        {'text': 'white', 'score': 2},
      ]
    }, //map
    {
      'questionText': "What is your fav food",
      'answers': [
        {'text': 'mo:mo', 'score': 1},
        {'text': 'pizza', 'score': 8},
        {'text': 'burger', 'score': 5},
        {'text': 'chopsy', 'score': 2},
      ]
    },
    {
      'questionText': "What is your fav mobile brand",
      'answers': [
        {'text': 'Apple', 'score': 5},
        {'text': 'Samsung', 'score': 8},
        {'text': 'MI', 'score': 5},
        {'text': 'Sony', 'score': 2},
      ]
    },
  ];

  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('more question');
    } else {
      print('no more question');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('my app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
