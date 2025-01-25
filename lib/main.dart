import 'package:flutter/material.dart';
import 'package:my_1st_app/pokedex.dart';
import 'package:my_1st_app/pokemon.dart';

main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  // build == draw
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Pokedex'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: pokedex.length,
          itemBuilder: (_, index) {
            final pkm = Pokemon.fromJson(pokedex[index]);
            final id = pkm.id;
            final description = pkm.description;
            final types = pkm.type;
            final name = pkm.name.english;
            final species = pkm.species;

            const typeColors = {
              'normal': 0xFFA8A77A,
              'fire': 0xFFEE8130,
              'water': 0xFF6390F0,
              'electric': 0xFFF7D02C,
              'grass': 0xFF7AC74C,
              'ice': 0xFF96D9D6,
              'fighting': 0xFFC22E28,
              'poison': 0xFFA33EA1,
              'ground': 0xFFE2BF65,
              'flying': 0xFFA98FF3,
              'psychic': 0xFFF95587,
              'bug': 0xFFA6B91A,
              'rock': 0xFFB6A136,
              'ghost': 0xFF735797,
              'dragon': 0xFF6F35FC,
              'dark': 0xFF705746,
              'steel': 0xFFB7B7CE,
              'fairy': 0xFFD685AD,
            };

            return ListTile(
              leading: Text('#$id'),
              title: Text('$name ($species)'),
              trailing: Image.asset(pkm.image.hires ?? pkm.image.sprite),
              subtitle: Row(
                spacing: 8,
                children: [
                  for (final tp in types)
                    Text(
                      tp,
                      style: TextStyle(
                        color:
                            Color(typeColors[tp.toLowerCase()] ?? 0xff000000),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
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
