import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class QuizWidget extends StatelessWidget {
  final List<Map<String, dynamic>> questionsObj;
  final Function answerQuestions;
  final int questionIndex;
  const QuizWidget({
    Key? key,
    required this.answerQuestions,
    required this.questionsObj,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: QuestionsText(
            questionsObj[questionIndex]['questionText'],
          ),
        ),
        ...(questionsObj[questionIndex]['answer'] as List<Map<String, dynamic>>)
            .map((answer) {
          return AnswerWidget(
              () => answerQuestions(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
