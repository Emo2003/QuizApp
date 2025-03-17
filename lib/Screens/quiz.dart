import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/result.dart';
import 'package:quiz_app/component/nextButton.dart';
import 'package:quiz_app/data/countOfQuestion.dart';
import 'package:quiz_app/data/functions.dart';
import 'package:quiz_app/data/listQuestions.dart';
import 'package:quiz_app/data/options.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizLogic quizLogic = QuizLogic(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 69, 8, 148),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Quiz App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
           
            QuestionsCounter(
              currentIndex: quizLogic.currentIndex,
              totalQuestions: questions.length,
            ),
            const SizedBox(height: 23),
            
            Text(
              questions[quizLogic.currentIndex]
                  ["question"], 
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
           
            Column(
              children: [
                Options(
                  options: questions[quizLogic.currentIndex]["options"]
                      as List<String>,
                  selectedAnswer: quizLogic.selectedAnswer,
                  onOptionSelected: (option) {
                    setState(() {
                      quizLogic.selectedAnswer = option;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: NextButton(
                  onPressed: () {
                    if (quizLogic.selectedAnswer != null) {
                      setState(() {
                        
                        quizLogic.checkAnswer(
                            questions[quizLogic.currentIndex]["correctAnswer"]);

                        
                        if (quizLogic.currentIndex == questions.length - 1) {
                         
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                correctAnswer: quizLogic.correctAnswer,
                                wrongAnswer: quizLogic.wrongAnswer,
                                result:
                                    questions.length - quizLogic.wrongAnswer,
                                totalOfQuestions: questions.length,
                                onReset: () {
                                  setState(() {
                                    quizLogic.resetQuiz();
                                  });
                                },
                              ),
                            ),
                          );
                        } else {
                          
                          quizLogic.nextQuestion(questions.length);
                        }
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
