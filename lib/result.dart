import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  const Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore >= 5) {
      resultText = 'You passed. Your score is $resultScore out of 11';
    } else {
      resultText = 'You failed. Your score is $resultScore out of 11';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    //print(resultScore);
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetQuiz,
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text(
              'Restart Quiz!',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
