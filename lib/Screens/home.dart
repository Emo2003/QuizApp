import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/quiz.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 69, 8, 148),
        body: Column(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/bamboozled.webp"),
                    radius: 120,
                  ),
                ),
                Center(
                  child: Padding(
                    padding:  EdgeInsets.all(20),
                    child: Text(
                      "This app contains questions about anything. Try your luck!",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromARGB(255, 242, 242, 243)),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    
                    elevation: WidgetStateProperty.all<double>(20),
                    shadowColor: WidgetStateProperty.all<Color>(
                        Colors.black.withOpacity(0.9)),
                        
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const QuizScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Go to Quiz",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
