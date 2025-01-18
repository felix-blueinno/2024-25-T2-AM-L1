import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('App Bar Here'),
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            children: [
              Icon(Icons.person, size: 48),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Felix Wong'),
                  Text('Student'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
