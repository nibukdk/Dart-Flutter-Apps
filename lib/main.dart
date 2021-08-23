import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex >= 2) {
      _questionIndex = 0;
    }
    setState(() => _questionIndex += 1);
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'question': "What's your favorite animal?",
        'answers': ['Dog', 'Cat', 'Horse', 'Rat']
      },
      {
        'question': "What's your favorite color?",
        'answers': ['Black', 'White', 'Green', 'Red']
      },
      {
        'question': "What's your favorite country?",
        'answers': ['Finland', 'Nepal', 'Austrailia', 'Canada']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['question'] as String,
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(_answerQuestion, answer))
                .toList()
          ],
        ),
      ),
    );
  }
}
