import 'package:flutter/material.dart';
import 'package:my_1st_app/pokedex.dart';
import 'package:my_1st_app/pokemon.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('What Is A Pavlova'),
          titleTextStyle: TextStyle(fontSize: 32),
          centerTitle: true,
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokedex.length,
                itemBuilder: (context, index) {
                  final pkm = Pokemon.fromJson(pokedex[index]);
                  final id = pkm.id;
                  final sp = pkm.species;
                  final name = pkm.name;
                  final eng = name.english;
                  final sprite = pkm.image.sprite;
                  final hires = pkm.image.hires;

                  return ListTile(
                    leading: Text('#$id'),
                    title: Text('$eng'),
                    subtitle: Text('$sp'),
                    trailing: Image.asset(hires ?? sprite),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lesson1 extends StatelessWidget {
  const Lesson1({
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
              Icon(Icons.person, size: 62),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Jayden Tang'), Text('student')],
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text('Pavlovas'),
                    Text(
                        'Pavlova is a meringue-based dessert yada yada yada...'),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Spacer(),
                        Text('170 reviews')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.kitchen),
                        Icon(Icons.timelapse),
                        Icon(Icons.food_bank)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('PREP:'),
                        Text('COOK:'),
                        Text('FEEDS:'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('25 mins:'),
                        Text('1 hr:'),
                        Text('4-6:'),
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
