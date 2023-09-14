import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I am rich',
      home: Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          backgroundColor: Colors.red[500],
          title: const Text('I am rich'),
          leading: const Text('Leading'),
          actions: const [
            Text('A1'),
            Text('A2'),
            Text('A3'),
            Text('A4'),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/image.png'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.amber),
            BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Users',
                backgroundColor: Colors.green),
          ],
          selectedItemColor: Colors.red,
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
