import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_1st_app/screens/pkm_tcg_screen.dart';

class SurvivalScreen extends StatefulWidget {
  const SurvivalScreen({super.key});

  @override
  State<SurvivalScreen> createState() => _SurvivalScreenState();
}

class _SurvivalScreenState extends State<SurvivalScreen> {
  var wallet = 100.0;

  @override
  Widget build(BuildContext context) {
    final packs = [
      ('Base', 20),
      ('Black & White', 20),
      ('Colosseum', 20),
      ('Diamond & Perl', 20),
      ('E-Card', 20),
      ('Ex', 20),
      ('Gym', 20),
      ('HeartGold and SoulSilver', 20),
      ('Neo Genesis', 20),
      ('Platinum', 20),
      ('Sun & Moon', 20),
      ('Sword & Shield', 20),
      ('XY', 20),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Survival'),
        actions: [
          Text('\$$wallet'),
          SizedBox(width: 8),
        ],
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pack $index'),
                Align(child: Text('\$20')),
              ],
            ),
            Expanded(
              child: Card(
                child: InkWell(
                  onTap: () {
                    // check if they have $20:
                    if (wallet < 20) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text('You are broke...'),
                        ),
                      );
                      return;
                    }

                    // reduce wallet by $20:
                    wallet -= 20;
                    setState(() {}); // refresh the screen

                    showDialog(
                      context: context,
                      builder: (context) => PkmTcgScreen(),
                    );
                  },
                  child: Placeholder().animate().fadeIn(delay: 0.5.seconds),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
