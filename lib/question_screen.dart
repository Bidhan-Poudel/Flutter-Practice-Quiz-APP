import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 240, 224, 224),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((item){
              return AnswerButton(answerText: item, onTap: (){
                answerQuestion(item);
              },);
            }),
            // AnswerButton(
            //   onTap: () {},
            //   answerText: currentQuestion.answers[0],
            // ),
            // AnswerButton(
            //   onTap: () {},
            //   answerText: currentQuestion.answers[1],
            // ),
            // AnswerButton(
            //   onTap: () {},
            //   answerText: currentQuestion.answers[2],
            // ),
            // AnswerButton(
            //   onTap: () {},
            //   answerText: currentQuestion.answers[3],
            // ),
          ],
        ),
      ),
    );
  }
}
