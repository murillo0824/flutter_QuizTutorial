import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
// import material.dart from flutter to use Widget

void main() => runApp(const MyApp());

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<String> questions = ['questions 1', 'questions 2'];
  List<Map<String, dynamic>> questionsObj = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      'questionText': 'who\'s your teacher?',
      'answer': ['Murillo', 'max', 'Shoiti', 'Leon']
    },
  ];

  int _questionIndex = 0;
  void _answerQuestions() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < questionsObj.length) {
      print('you have more answer');
    } else {
      print('you don\'t have more answer');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _questionIndex < questionsObj.length
          ? Column(
              children: [
                Center(
                  child: QuestionsText(
                    questionsObj[_questionIndex]['questionText'],
                  ),
                ),
                ...(questionsObj[_questionIndex]['answer'] as List<String>)
                    .map((answer) {
                  return AnswerWidget(_answerQuestions, answer);
                }).toList()
              ],
            )
          : const Center(
              child: Text('you ended all questions'),
            ),
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
