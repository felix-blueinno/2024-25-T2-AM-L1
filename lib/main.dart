import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_1st_app/screens/pkm_tcg_screen.dart';
import 'package:my_1st_app/screens/pokemon_screen.dart';

main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  // build == draw
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          builder: (context) => PkmTcgScreen(),
        );

        if (settings.name == '/ygo') {
          return CupertinoPageRoute(
            builder: (context) => PkmTcgScreen(),
          );
        }

        if (settings.name == '/fifa') {
          return CupertinoPageRoute(
            builder: (context) => PkmTcgScreen(),
          );
        }

        if (settings.name == '/pkm-tcg') {
          return CupertinoPageRoute(
            builder: (context) => PkmTcgScreen(),
          );
        }

        return CupertinoPageRoute(
          builder: (context) => PokemonScreen(),
        );
      },
      // home: PokemonScreen(),
    );
  }
}

class DummyRecipe extends StatelessWidget {
  const DummyRecipe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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

        // ! Our recipe here:
        SizedBox(
          height: 300,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  spacing: 16,
                  children: [
                    Text(
                      'Strawberry Pavlova',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.pink.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('My Recipe here'),

                    // Rating:
                    Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Spacer(),
                        Text('170 Reviews'),
                      ],
                    ),

                    Row(
                      children: [
                        Icon(Icons.book),
                        Icon(Icons.timelapse),
                        Icon(Icons.food_bank),
                      ],
                    ),
                    Row(
                      children: [
                        Text('PREP:'),
                        Text('COOK:'),
                        Text('FEEDS:'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('25 min'),
                        Text('1 hr'),
                        Text('4-6'),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Placeholder(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
