import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quiz = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quizzler',
      home: Quizzler(title: 'Quizzler'),
    );
  }
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key, required this.title});
  final String title;

  @override
  State<Quizzler> createState() => _Quizzler();
}

class _Quizzler extends State<Quizzler> {
  final correct = const Icon(
    Icons.check,
    color: Colors.green,
  );
  final incorrect = const Icon(
    Icons.close,
    color: Colors.red,
  );

  int correctPoints = 0;
  int incorrectPoints = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: [
              correct,
              Text('$correctPoints'),
            ],
          ),
          Row(
            children: [
              incorrect,
              Text('$incorrectPoints'),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                  child: Text(
                quiz.getQuestion(),
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
              )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: sendTrue,
                  child: const Text('True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: sendFalse,
                  child: const Text('False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendTrue() {
    checkAnswer(true);
  }

  void sendFalse() {
    checkAnswer(false);
  }

  void checkAnswer(bool usrInput) => {
        setState(() {
          quiz.checkAnswer(usrInput);
          correctPoints = quiz.getcorrectPoints();
          incorrectPoints = quiz.getincorrectPoints();
          if (quiz.lastQuestion()) {
            // Mostrar alerta
            Alert(
                context: context,
                title: "END OF THE GAME",
                desc: "Corrects $correctPoints, Incorrects: $incorrectPoints",
                buttons: [
                  DialogButton(
                    onPressed: () {
                      quiz.restartGame();
                      Navigator.pop(context);
                      correctPoints = quiz.getcorrectPoints();
                      incorrectPoints = quiz.getincorrectPoints();
                    },
                    child: const Text('Restart'),
                  )
                ]).show();
          } else {
            quiz.changeQuestion();
          }
        })
      };
}
