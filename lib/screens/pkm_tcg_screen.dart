import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_1st_app/data/pokemon_card.dart';
import 'package:my_1st_app/data/xy7.dart';
import 'package:my_1st_app/data/xy8.dart';
import 'package:my_1st_app/widgets/route_drawer.dart';

class PkmTcgScreen extends StatefulWidget {
  const PkmTcgScreen({super.key});

  @override
  State<PkmTcgScreen> createState() => _PkmTcgScreenState();
}

class _PkmTcgScreenState extends State<PkmTcgScreen> {
  final controller = ConfettiController(duration: Duration(seconds: 2));
  // ..play();

  final _allCards = <PokemonCard>[];
  final _drawResults = <PokemonCard>[];

  @override
  void initState() {
    super.initState();

    _allCards.addAll(xy7.map((e) => PokemonCard.fromJson(e)));
    _allCards.addAll(xy8.map((e) => PokemonCard.fromJson(e)));
    _allCards.shuffle();

    _drawResults.addAll(_allCards.take(8));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PKM TCG'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              final rarities = [
                ('Common', 60),
                ('Uncommon', 30),
                ('Rare', 9),
                ('Rare Holo EX', 1),
              ];
              final random = Random().nextDouble() * 100;
              var cumulative = 0;
              var index = 0;

              for (final rarity in rarities) {
                cumulative += rarity.$2;
                if (random <= cumulative) {
                  index = rarities.indexOf(rarity);
                  break;
                }
              }
              final rar = rarities[index];
              final pool = _allCards.where((e) => e.rarity == rar.$1).toList();
              _drawResults.clear();
              pool.shuffle();
              _drawResults.addAll(pool.take(8));

              final hasRare =
                  _drawResults.any((e) => e.rarity?.contains('Rare') ?? false);
              if (hasRare) controller.play();

              setState(() {}); // refresh the page
            },
          ),
        ],
      ),
      drawer: RouteDrawer(),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: _drawResults.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 245,
              childAspectRatio: 245 / 342,
            ),
            itemBuilder: (context, index) {
              final pkmCard = _drawResults[index];
              final image = pkmCard.images?.small;

              if (image == null) return Placeholder();
              return Card(
                key: ValueKey(pkmCard),
                child: Image.network(image),
              ).animate().fadeIn(delay: 0.5.seconds).rotate().flipH().slideX();
            },
          ),
          Positioned(
            left: 0,
            top: 0,
            child: ConfettiWidget(
              confettiController: controller,
              shouldLoop: false,
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
              shouldLoop: false,
              blastDirection: 2.356, // 135º
              emissionFrequency: 0.1,
              numberOfParticles: 50,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: controller,
              shouldLoop: false,
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
