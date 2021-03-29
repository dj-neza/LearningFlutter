import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(QuizioApp());

class QuizioApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizioAppState();
  }
}

class _QuizioAppState extends State<QuizioApp> {
  final _questions = const [
    {
      'question': 'What\'s your favourite color?',
      'answers': [
        {'text': 'blue', 'score': 1},
        {'text': 'red', 'score': 7},
        {'text': 'black', 'score': 10},
        {'text': 'yellow', 'score': 5},
        {'text': 'pink', 'score': 3}
      ],
    },
    {
      'question': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'horse', 'score': 3},
        {'text': 'swan', 'score': 2},
        {'text': 'dog', 'score': 1},
        {'text': 'cat', 'score': 7},
        {'text': 'spider', 'score': 10},
      ],
    },
    {
      'question': 'Where\'s your favourite vacation?',
      'answers': [
        {'text': 'seaside', 'score': 3},
        {'text': 'cruise', 'score': 1},
        {'text': 'desert', 'score': 8},
        {'text': 'city', 'score': 6},
      ],
    }
  ];

  var _qIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _qIndex += 1;
      _totalScore += score;
    });
  }

  void _resetQuiz() {
    setState(() {
      _qIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizio'),
        ),
        body: _qIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                qIndex: _qIndex)
            : Result(
                _totalScore,
                _resetQuiz,
              ),
      ),
    );
  }
}
