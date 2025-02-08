import 'package:flutter/material.dart';

class PkmTcgScreen extends StatelessWidget {
  const PkmTcgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PKM TCG'),
      ),
      drawer: Drawer(),
    );
  }
}
