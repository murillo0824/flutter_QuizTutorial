import 'package:flutter/material.dart';

class QuestionsText extends StatelessWidget {
  final String questionText;
  // const QuestionsText({Key? key}) : super(key: key);

  const QuestionsText(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        questionText,
        style: const TextStyle(
          fontSize: 32,
        ),
        textAlign: TextAlign.center,
      ),
      width: double.infinity,
      margin: const EdgeInsets.all(10),
    );
  }
}
