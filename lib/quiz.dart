import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget?activeScreen;

  // void initState() {
  //  activeScreen=StartScreen(switchScreen);

  //  super.initState();
  // }

  var activeScreen = 'Start-Screen';

  void switchScreen() {
    setState(() {
      // activeScreen= const QuestionScreen();
      activeScreen = 'Question-Screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget= StartScreen(switchScreen);

  if(activeScreen=="Question-Screen"){
    screenWidget=const QuestionScreen();
  }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.redAccent,
                Colors.purpleAccent,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          // child: activeScreen == 'Start-Screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
