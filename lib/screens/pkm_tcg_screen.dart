import 'dart:convert';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/pokemon_card.dart';

class PkmTcgScreen extends StatefulWidget {
  const PkmTcgScreen({
    super.key,
    this.packPaths,
  });

  final List<String>? packPaths;

  @override
  State<PkmTcgScreen> createState() => _PkmTcgScreenState();
}

class _PkmTcgScreenState extends State<PkmTcgScreen> {
  final controller = ConfettiController(duration: Duration(seconds: 2));
  // ..play();

  final _allCards = <PokemonCard>[];
  final _drawResults = <PokemonCard>[];

  final rareProbs = {
    // 'Uncommon': 0,
    // 'Common': 0,
    'Amazing Rare': 0.1,
    'Shiny Ultra Rare': 0.1,
    'Rare Ultra': 0.1,
    'Rare ACE': 0.1,
    'Rare Rainbow': 0.1,
    'Rare Shiny GX': 0.1,
    'Rare Holo VSTAR': 0.1,
    'Rare Shiny': 0.1,
    'Double Rare': 0.1,
    'ACE SPEC Rare': 0.1,
    'Promo': 0.1,
    'Classic Collection': 0.1,
    'Rare Secret': 0.1,
    'Rare Holo Star': 0.1,
    'Rare BREAK': 0.1,
    'Rare Prism Star': 0.1,
    'Ultra Rare': 0.1,
    'Rare Holo LV.X': 0.1,
    'Hyper Rare': 0.1,
    'Rare Prime': 0.1,
    'Rare Shining': 0.1,
    'Trainer Gallery Rare Holo': 0.1,
    'Radiant Rare': 0.1,
    'Rare': 0.1,
    'Rare Holo VMAX': 0.1,
    'Rare Holo EX': 0.1,
    'Special Illustration Rare': 0.1,
    'Illustration Rare': 0.1,
    'Shiny Rare': 0.1,
    'Rare Holo': 0.1,
    'Rare Holo GX': 0.1,
    'Rare Holo V': 0.1,
    'LEGEND': 0.1,
  };

  final rareColors = {
    'Uncommon': Colors.black,
    'Common': Colors.black,
    'Amazing Rare': Colors.amber,
    'Shiny Ultra Rare': Colors.amber,
    'Rare Ultra': Colors.amber,
    'Rare ACE': Colors.amber,
    'Rare Rainbow': Colors.amber,
    'Rare Shiny GX': Colors.amber,
    'Rare Holo VSTAR': Colors.amber,
    'Rare Shiny': Colors.amber,
    'Double Rare': Colors.amber,
    'ACE SPEC Rare': Colors.amber,
    'Promo': Colors.amber,
    'Classic Collection': Colors.amber,
    'Rare Secret': Colors.amber,
    'Rare Holo Star': Colors.amber,
    'Rare BREAK': Colors.amber,
    'Rare Prism Star': Colors.amber,
    'Ultra Rare': Colors.amber,
    'Rare Holo LV.X': Colors.amber,
    'Hyper Rare': Colors.amber,
    'Rare Prime': Colors.amber,
    'Rare Shining': Colors.amber,
    'Trainer Gallery Rare Holo': Colors.amber,
    'Radiant Rare': Colors.amber,
    'Rare': Colors.amber,
    'Rare Holo VMAX': Colors.amber,
    'Rare Holo EX': Colors.amber,
    'Special Illustration Rare': Colors.amber,
    'Illustration Rare': Colors.amber,
    'Shiny Rare': Colors.amber,
    'Rare Holo': Colors.amber,
    'Rare Holo GX': Colors.amber,
    'Rare Holo V': Colors.amber,
    'LEGEND': Colors.amber,
  };

  final sellingPriceList = {
    'Uncommon': 10,
    'Common': 10,
    'Amazing Rare': 10,
    'Shiny Ultra Rare': 10,
    'Rare Ultra': 10,
    'Rare ACE': 10,
    'Rare Rainbow': 10,
    'Rare Shiny GX': 10,
    'Rare Holo VSTAR': 10,
    'Rare Shiny': 10,
    'Double Rare': 10,
    'ACE SPEC Rare': 10,
    'Promo': 10,
    'Classic Collection': 10,
    'Rare Secret': 10,
    'Rare Holo Star': 10,
    'Rare BREAK': 10,
    'Rare Prism Star': 10,
    'Ultra Rare': 10,
    'Rare Holo LV.X': 10,
    'Hyper Rare': 10,
    'Rare Prime': 10,
    'Rare Shining': 10,
    'Trainer Gallery Rare Holo': 10,
    'Radiant Rare': 10,
    'Rare': 10,
    'Rare Holo VMAX': 10,
    'Rare Holo EX': 10,
    'Special Illustration Rare': 10,
    'Illustration Rare': 10,
    'Shiny Rare': 10,
    'Rare Holo': 10,
    'Rare Holo GX': 10,
    'Rare Holo V': 10,
    'LEGEND': 10,
  };

  @override
  void initState() {
    super.initState();

    final paths = widget.packPaths ?? ['base1'];
    final futures = paths.map((e) => rootBundle.loadString('tcg_data/$e.json'));

    Future.wait(futures).then((files) {
      final allCards = files.map((fileStr) {
        final cards = jsonDecode(fileStr) as List;
        return cards.map((e) => PokemonCard.fromJson(e));
      }).expand((e) => e);

      _allCards.addAll(allCards);
      _allCards.shuffle();

      _drawCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('PKM TCG'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.refresh),
      //       onPressed: () => _drawCard(),
      //     ),
      //   ],
      // ),
      // drawer: RouteDrawer(),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: _drawResults.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 245,
              childAspectRatio: 245 / (342 + 20),
            ),
            itemBuilder: (context, index) {
              final pkmCard = _drawResults[index];
              final image = pkmCard.images?.small;

              if (image == null) return Placeholder();

              final rarity = pkmCard.rarity;
              final color = rareColors[rarity];
              final prob = rareProbs[rarity];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        rarity ?? 'Unknown',
                        style: GoogleFonts.getFont(
                          'Press Start 2P',
                          fontSize: 8,
                          color: color,
                        ),
                      ),
                      if (prob != null)
                        Text(
                          '($prob%)',
                          style: GoogleFonts.getFont(
                            'Press Start 2P',
                            fontSize: 8,
                            color: color,
                          ),
                        ),
                    ],
                  ),
                  Card(child: Image.network(image)).animate().fadeIn(),
                ],
              );
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

  void _drawCard() {
    _drawResults.clear();

    final availableRares = _allCards
        .map((e) => e.rarity)
        .toSet()
        .where((e) => e != null && e != 'Common' && e != 'Uncommon');

    final rarities = <String, num>{};
    var remaining = 100.0;
    for (final r in availableRares) {
      rarities[r!] = rareProbs[r]!;
      remaining -= rareProbs[r]!;
    }
    rarities['Uncommon'] = remaining * 0.20;
    rarities['Common'] = remaining * 0.80;

    for (var i = 0; i < 15; i++) {
      final random = Random().nextDouble() * 100;
      var cumulative = 0.0;
      var rarity = '';

      for (final entry in rarities.entries) {
        final prob = entry.value;

        cumulative += prob;
        if (random <= cumulative) {
          rarity = entry.key;
          break;
        }
      }

      final filtered = _allCards.where((e) => e.rarity == rarity).toList();

      filtered.shuffle();
      _drawResults.addAll(filtered.take(1));
    }

    final hasRare = _drawResults.any((e) =>
        e.rarity != null && e.rarity != 'Common' && e.rarity != 'Uncommon');
    if (hasRare) controller.play();

    setState(() {}); // refresh the page
  }
}
