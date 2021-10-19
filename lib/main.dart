import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'qiz_brain.dart';

QuizBrain qb = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  reset() => _onBasicAlertPressed(context);

  void checkAnswer(bool userAnswer) {
    bool? correctAnswer = qb.getQuestionAnswer();
    if (userAnswer == correctAnswer) {
      scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.blueAccent,
        ),
      );
    } else {
      scoreKeeper.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    if (qb.nextQuestion()) {
      _onBasicAlertPressed(context);
      scoreKeeper = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            child: Center(
              child: Text(
                qb.getQuestionText() ?? '',
                style: TextStyle(fontSize: 30),
              ),
            ),
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                //user press true
                setState(() {
                  checkAnswer(true);
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
              ),
              child: const Text(
                'YES',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                primary: Colors.white,
              ),
              child: const Text(
                'NO',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

// The easiest way for creating RFlutter Alert
_onBasicAlertPressed(context) {
  Alert(
    context: context,
    title: "Finished!",
    desc: "You\'ve reached the end of the quiz",
  ).show();
}
