import 'package:flutter/material.dart';
import 'package:my_1st_app/widgets/route_drawer.dart';

class FifaScreen extends StatelessWidget {
  const FifaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PKM TCG'),
      ),
      drawer: RouteDrawer(),
    );
  }
}
