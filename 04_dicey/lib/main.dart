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
      title: 'Dicey',
      home: Dicey(title: 'Dicey'),
    );
  }
}

class Dicey extends StatefulWidget {
  const Dicey({super.key, required this.title});

  final String title;
  final max = 6;

  @override
  State<Dicey> createState() => _DiceyState();
}

class _DiceyState extends State<Dicey> {
  int _leftdicenumber = 1;
  int _rigthdicenumber = 1;
  int _totalDice = 2;
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: rollDice,
                    child:
                        Image.asset('assets/images/dice$_leftdicenumber.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: rollDice,
                    child:
                        Image.asset('assets/images/dice$_rigthdicenumber.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              'Total: $_totalDice',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void rollDice() {
    setState(() {
      _leftdicenumber = _random.nextInt(widget.max) + 1;
      _rigthdicenumber = _random.nextInt(widget.max) + 1;
      _totalDice = _leftdicenumber + _rigthdicenumber;
    });
  }
}
