import 'package:flutter/material.dart';

void main() => runApp(QuizioApp());

class QuizioApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return QuizioAppState();
  }
}

class QuizioAppState extends State<QuizioApp> {

  var qIndex = 0;

  void answerQuestion() {
    setState(() {
      qIndex = qIndex + 1;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    var questions = [
      'What\'s your favourite color?',
      'What\'s your favourite animal?'
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
            Text(questions[qIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () {
                print("lalala");
              },
            ),
          ],
        ),
      ),
    );
  }
}
