import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:my_1st_app/data/pokemon_card.dart';
import 'package:my_1st_app/data/xy7.dart';
import 'package:my_1st_app/widgets/route_drawer.dart';

class PkmTcgScreen extends StatefulWidget {
  const PkmTcgScreen({super.key});

  @override
  State<PkmTcgScreen> createState() => _PkmTcgScreenState();
}

class _PkmTcgScreenState extends State<PkmTcgScreen> {
  final controller = ConfettiController(duration: Duration(seconds: 2))..play();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PKM TCG'),
      ),
      drawer: RouteDrawer(),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: xy7.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 245,
              childAspectRatio: 245 / 342,
            ),
            itemBuilder: (context, index) {
              final raw = xy7[index];
              final pkmCard = PokemonCard.fromJson(raw);
              final image = pkmCard.images?.small;

              if (image == null) return Placeholder();
              return Card(child: Image.network(image));
            },
          ),
          Positioned(
            left: 0,
            top: 0,
            child: ConfettiWidget(
              confettiController: controller,
              shouldLoop: true,
              blastDirection: 0.785, // 45º
              emissionFrequency: 0.1,
              numberOfParticles: 50,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: ConfettiWidget(
              confettiController: controller,
              shouldLoop: true,
              blastDirection: 2.356, // 135º
              emissionFrequency: 0.1,
              numberOfParticles: 50,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: controller,
              shouldLoop: true,
              blastDirection: pi / 2,
              emissionFrequency: 0.1,
              numberOfParticles: 50,
            ),
          ),
        ],
      ),
    );
  }
}
