import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Quizzler(),
      ),
    ),
  ));
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    //Basic Alert
    if (quizBrain.isLastQuestion()) {
      quizBrain.reset();
      scoreKeeper = [];
      Alert(
              context: context,
              title: "Finished!",
              desc: "You've reached the end of the quiz.")
          .show();
      return;
    }

    if (userPickedAnswer == quizBrain.getQuestionAnswer()) {
      scoreKeeper.add(
        const Icon(Icons.check, color: Colors.green),
      );
    } else {
      scoreKeeper.add(
        const Icon(Icons.close, color: Colors.red),
      );
    }
    quizBrain.getNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              style: const TextStyle(color: Colors.white, fontSize: 35),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    checkAnswer(true);
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                child: const Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    checkAnswer(false);
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                child: const Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
