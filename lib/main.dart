import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

void main() => runApp(QuizioApp());

class QuizioApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizioAppState();
  }
}

class _QuizioAppState extends State<QuizioApp> {
  var _qIndex = 0;

  void _answerQuestion() {
    setState(() {
      _qIndex = _qIndex + 1;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    const questions = [
      {
        'question': 'What\'s your favourite color?',
        'answers': ['blue', 'red', 'yellow', 'black']
      },
      {
        'question': 'What\'s your favourite animal?',
        'answers': ['horse', 'swan', 'dog', 'cat', 'spider']
      },
      {
        'question': 'Where\'s your favourite vacation?',
        'answers': ['mountains', 'seaside', 'desert', 'city', 'cruis']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizio'),
        ),
        body: Column(
          // this is how to type the list - below is an example of a list
          // of widgets
          children: [
            // referring to lists by index (starts at 0 in Dart)
            // can also be done: questions.elementAt(0)
            Question(
              questions[_qIndex]['question'],
            ),
            ...(questions[_qIndex]['answers'] as List<String>).map((answer) {
              return Answer(answer, _answerQuestion);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
