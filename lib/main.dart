import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void addScore(bool type) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    if (type == correctAnswer) {
      scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
    } else {
      scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
    }
  }

  Expanded buildButton(bool type, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(color),
          ),
          onPressed: () {
            setState(() {
              if (quizBrain.isFinished()) {
                Alert(
                  context: context,
                  title: 'Finished!',
                  desc: 'You\'ve reached the end of the quiz.',
                ).show();
                quizBrain.reset();
                scoreKeeper = [];
              } else {
                addScore(type);
              }
              quizBrain.nextQuestion();
            });
          },
          child: Text(
            (type) ? 'True' : 'False',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        buildButton(true, Colors.green),
        buildButton(false, Colors.red),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
