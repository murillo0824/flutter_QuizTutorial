import 'package:flutter/material.dart';
import './question.dart';
// import material.dart from flutter to use Widget

void main() => runApp(const MyApp());

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<String> questions = ['questions 1', 'questions 2'];
  int _questionIndex = 0;
  void _answerQuestions() {
    if (_questionIndex == 0) {
      setState(() {
        _questionIndex = 1;
      });
    } else {
      setState(() {
        _questionIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: QuestionsText(
              questions[_questionIndex],
            ),
          ),
          ElevatedButton(
              onPressed: _answerQuestions, child: const Text("Answer1")),
          ElevatedButton(
              onPressed: _answerQuestions, child: const Text("Answer2")),
          ElevatedButton(
              onPressed: _answerQuestions, child: const Text("Answer3")),
          ElevatedButton(
              onPressed: _answerQuestions, child: const Text("Answer4")),
        ],
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
