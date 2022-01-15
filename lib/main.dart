import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// import material.dart from flutter to use Widget

void main() => runApp(const MyApp());

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<String> questions = ['questions 1', 'questions 2'];
  final List<Map<String, dynamic>> _questionsObj = [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 4}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'animal1', 'score': 1},
        {'text': 'animal2', 'score': 2},
        {'text': 'animal3', 'score': 3},
        {'text': 'animal4', 'score': 4}
      ]
    },
    {
      'questionText': 'who\'s your teacher?',
      'answer': [
        {'text': 'name1', 'score': 1},
        {'text': 'name2', 'score': 2},
        {'text': 'name3', 'score': 3},
        {'text': 'name4', 'score': 4}
      ]
    },
  ];

  int _questionIndex = 0;

  int _totalScore = 0;

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questionsObj.length) {
      print('you have more answer');
    } else {
      print('you don\'t have more answer');
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
    return Container(
      child: _questionIndex < _questionsObj.length
          ? QuizWidget(
              answerQuestions: _answerQuestions,
              questionIndex: _questionIndex,
              questionsObj: _questionsObj,
            )
          : Result(_totalScore, _resetQuiz),
      padding: const EdgeInsets.all(15),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //Widget に関連する定義は全て同じクラス内で行う。
  // 外側に変数宣言や、関数を定義しない

  // decorator to announce
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('my first app'),
          backgroundColor: Colors.lightBlue[200],
        ),
        body: ListView(children: const [
          Question(),
        ]),
      ),
    );
  }
}
