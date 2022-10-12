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
      'questionText':
          "Q1. The default access specifer for the class members is",
      'answers': [
        {'text': 'public', 'score': 0},
        {'text': 'private', 'score': 1},
        {'text': 'protected', 'score': 0},
        {'text': 'None of the above.', 'score': 0},
      ]
    }, //map
    {
      'questionText': "Q2. ‘cin’ is an __",
      'answers': [
        {'text': ' Class', 'score': 0},
        {'text': 'Object', 'score': 1},
        {'text': 'Package', 'score': 0},
        {'text': 'Namespace', 'score': 0},
      ]
    },
    {
      'questionText':
          "Q3.  Pick up the valid declaration for overloading ++ in postfix form where T is the class name.",
      'answers': [
        {'text': 'T operator++();', 'score': 0},
        {'text': 'T operator++(int);', 'score': 1},
        {'text': 'T& operator++();', 'score': 0},
        {'text': ' T& operator++(int);', 'score': 0},
      ]
    },
    {
      'questionText':
          "Q4. Escape sequence character ' `\0` ' occupies __ amount of memory.",
      'answers': [
        {'text': '0', 'score': 1},
        {'text': '1', 'score': 0},
        {'text': '2', 'score': 0},
        {'text': '4', 'score': 0},
      ]
    },
    {
      'questionText': "Q5. The copy constructor is executed on ",
      'answers': [
        {
          'text': 'Assigned one object to another object at its creation',
          'score': 0
        },
        {
          'text':
              'When objects are sent to function using call by value mechanism',
          'score': 0
        },
        {'text': ' When the function return an object', 'score': 0},
        {'text': 'All the above.', 'score': 1},
      ]
    },
    {
      'questionText':
          "Q6. HAS-A relationship between the classes is shown through. ",
      'answers': [
        {'text': 'Inheritance', 'score': 0},
        {'text': 'Container classes', 'score': 1},
        {'text': 'Polymorphism', 'score': 0},
        {'text': 'None of the above.', 'score': 0},
      ]
    },
    {
      'questionText':
          " Q7. Following is the invalid inclusion of a file to the current program. Identify it",
      'answers': [
        {'text': '#include <file>', 'score': 0},
        {'text': ' #include "file', 'score': 0},
        {'text': '#include < file', 'score': 1},
        {'text': 'All of the above are invalid', 'score': 0},
      ]
    },
    {
      'questionText': "Q8. C++ is a __________ programming language. ",
      'answers': [
        {'text': 'general-purpose', 'score': 0},
        {'text': ' procedural and functional', 'score': 0},
        {'text': ' object-oriented, generic, and modular', 'score': 0},
        {'text': 'All the above', 'score': 1},
      ]
    },
    {
      'questionText': "Q9. C++ designed by ",
      'answers': [
        {'text': 'Bjarne Stroustrup', 'score': 1},
        {'text': ' Dennis Ritchie', 'score': 0},
        {'text': 'James Gosling', 'score': 0},
        {'text': 'Albert Einstein', 'score': 0},
      ]
    },
    {
      'questionText': "Q10. What is the filename extension of a C++ program ? ",
      'answers': [
        {'text': '.cpp', 'score': 1},
        {'text': '.cp ', 'score': 0},
        {'text': '.cpr', 'score': 0},
        {'text': 'All the above', 'score': 0},
      ]
    },
    {
      'questionText': "Q11. C++ was first appeared in ",
      'answers': [
        {'text': ' 1985', 'score': 1},
        {'text': ' 1984', 'score': 0},
        {'text': '1995', 'score': 0},
        {'text': '1994', 'score': 0},
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
