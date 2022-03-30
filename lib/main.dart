import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp()); //arrow notation for only one line of code

class MyApp extends StatefulWidget {
  //it resets when state changes

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState(); //this underscore makes MyAppState accessible only from MyApp class
  }
}

class _MyAppState extends State<MyApp> {
  //this class doesnt get reset when state changes
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 15},
        {'text': 'Lion', 'score': 9},
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ]
    },
  ];
  var _questionIndex = 0;
  
  void _answerQuestion() {
    
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {}
  }

  //scaffold gives app basic design and colors
  //shift+alt+f format document
  //ctrl+shift+R refactor
  @override //just a decorator to make it clear we are overriding
  Widget build(BuildContext context) {
    //final means once created it doesn't change (it can get created again in different values) (constant in runtime but variable in compile time)
    //constant (const) means it never changes wala f compile time wala f runtime

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    );
  }
}
