import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText = 'You did it!';
    if (resultScore <= 7) {
      resultText = 'You are super cool and stuff!';
    } else if (resultScore <= 13) {
      resultText = 'You are pretty nice!';
    } else if (resultScore <= 18) {
      resultText = 'You are fine I guess...?';
    } else {
      resultText = 'What even? No comment.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetQuiz,
            child: Text('Restart the Quiz'),
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
