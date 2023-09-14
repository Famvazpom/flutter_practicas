import 'package:flutter/material.dart';
import 'package:presentation_card_famvazpom/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PresentationCardPage(),
    );
  }
}

class PresentationCardPage extends StatefulWidget {
  const PresentationCardPage({super.key});

  @override
  State<PresentationCardPage> createState() => _PresentationCardPageState();
}

class _PresentationCardPageState extends State<PresentationCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const CircleAvatar(
            radius: 150.0,
            backgroundColor: Colors.red,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          const Text(
            name,
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Handjet',
              color: Colors.white,
            ),
          ),
          const Text(
            title,
            style: TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 20,
              letterSpacing: 4,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
            width: 150,
            child: Divider(),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.blue[600],
              ),
              title: const Text(
                phone,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Handjet',
                  fontSize: 13,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Card(
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.blue[600],
                ),
                title: const Text(
                  mail,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Handjet',
                    fontSize: 13,
                    letterSpacing: .9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
