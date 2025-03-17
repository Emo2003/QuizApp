import 'package:flutter/material.dart';
import 'package:quiz_app/component/resetButton.dart';
import 'package:quiz_app/component/resultItems.dart';

class ResultPage extends StatelessWidget {
  final int correctAnswer;
  final int wrongAnswer;
  final int result;
  final int totalOfQuestions;
  final VoidCallback onReset;
  const ResultPage(
      {super.key,
      required this.correctAnswer,
      required this.wrongAnswer,
      required this.result,
      required this.totalOfQuestions,
      required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 69, 8, 148),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(" Result",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemsData(
                    correctAnswer: correctAnswer,
                    wrongAnswer: wrongAnswer,
                    result: result,
                    totalOfQuestions: totalOfQuestions,
                  )),
            ),
            const Spacer(),
            ButtonData(onResete: onReset)
          ],
        ));
  }
}
