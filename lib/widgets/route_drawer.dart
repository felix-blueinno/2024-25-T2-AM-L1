import 'package:flutter/material.dart';

class RouteDrawer extends StatelessWidget {
  const RouteDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Pokedex'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Pokemon-TCG'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/pkm-tcg');
            },
          ),
          ListTile(
            title: Text('YGO'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/ygo');
            },
          ),
          ListTile(
            title: Text('FIFA'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/fifa');
            },
          ),
        ],
      ),
    );
  }
}
