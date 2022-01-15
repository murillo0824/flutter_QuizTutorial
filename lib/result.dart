import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetFunc;
  const Result(this.totalScore, this.resetFunc, {Key? key, required})
      : super(key: key);

  // String get resultPhrase
  // 波かっこ内部の処理を行い、最終的にStringを返す。
  // あくまで、変数として、処理するもの

  String get resultPhrase {
    String resultText = 'you did it ';
    if (totalScore < 5) {
      resultText = 'you have less than 5';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(resultPhrase),
        ElevatedButton(
          child: const Text('reset the quize'),
          onPressed: resetFunc,
        )
      ],
    );
  }
}
