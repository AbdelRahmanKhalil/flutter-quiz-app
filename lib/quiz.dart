import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final VoidCallback answerQuestion;
  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),

        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
               answerQuestion, answer['text'] as String);
        }).toList()

        ///... to avoid adding a list to the list of children, it adds single values (from list of answers) to children list instead
        //dont call function with () as this returns void and not pointing
        //to the function itself instead use
        // RaisedButton(
        //     child: Text('Answer 2'),
        //     onPressed: () => print('Answer 2 chosen!')),
        // RaisedButton(
        //     child: Text('Answer 3'),
        //     onPressed: () {
        //       print('Answer 3 chosen');
        //     }),
      ],
    );
  }
}
