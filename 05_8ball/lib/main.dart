import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '8 Ball',
      home: WidgetBall(title: 'Flutter Demo Home Page'),
    );
  }
}

class WidgetBall extends StatefulWidget {
  const WidgetBall({super.key, required this.title});
  final String title;

  @override
  State<WidgetBall> createState() => _WidgetBallState();
}

class _WidgetBallState extends State<WidgetBall> {
  int _ballNumber = 1;
  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Me anything'),
      ),
      body: Container(
        color: Colors.blue[300],
        child: Center(
          child: TextButton(
            onPressed: changeBall,
            child: Image.asset('assets/images/ball$_ballNumber.png'),
          ),
        ),
      ),
    );
  }

  void changeBall() {
    setState(() {
      _ballNumber = _random.nextInt(5) + 1;
    });
  }
}
