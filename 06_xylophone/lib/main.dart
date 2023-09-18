import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Xylophone',
      home: Xylophone(title: 'Xylophone'),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key, required this.title});
  final String title;

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildNote(color: Colors.red, id: 1),
          buildNote(color: Colors.orange, id: 2),
          buildNote(color: Colors.yellow, id: 3),
          buildNote(color: const Color.fromARGB(255, 102, 187, 106), id: 4),
          buildNote(color: Colors.green, id: 5),
          buildNote(color: Colors.blue, id: 6),
          buildNote(color: Colors.purple, id: 7),
        ],
      ),
    );
  }

  Widget buildNote({required Color color, required int id}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () => playSound(id),
        child: const Text(''),
      ),
    );
  }

  void playSound(int id) {
    final player = AudioPlayer();
    player.play(AssetSource('audios/note$id.wav'));
  }
}
