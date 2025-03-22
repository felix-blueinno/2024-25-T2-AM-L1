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
      (
        'Base',
        100,
        'https://www.antiquetrader.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc4MzQzODgwMDEyMzQyODkz/pokemon-sealed-record2.jpg',
        ['base1', 'base2', 'base3', 'base4', 'base5', 'base6', 'basep']
      ),
      (
        'Black & White',
        80,
        'https://i0.wp.com/sixprizes.com/wp-content/uploads/pokemon-black-and-white-bw-logo-1.jpg?ssl=1',
        [
          'bw1',
          'bw2',
          'bw3',
          'bw4',
          'bw5',
          'bw6',
          'bw7',
          'bw8',
          'bw9',
          'bw10',
          'bw11'
        ]
      ),
      (
        'Colosseum',
        80,
        'https://archives.bulbagarden.net/media/upload/thumb/2/25/Colosseum_EN_boxart.png/250px-Colosseum_EN_boxart.png',
        ['col1', 'cel25', 'cel25c']
      ),
      (
        'Diamond & Pearl',
        70,
        'https://upload.wikimedia.org/wikipedia/en/7/71/Pok%C3%A9mon_Diamond_and_Pearl_logo.png',
        ['dp1', 'dp2', 'dp3', 'dp4', 'dp5', 'dp6', 'dp7', 'dpp']
      ),
      (
        'E-Card',
        10,
        'https://s3.pokeos.com/pokeos-uploads/tcg/eng/eseries.webp',
        ['ecard1', 'ecard2', 'ecard3'],
      ),
      (
        'EX',
        60,
        'https://ih1.redbubble.net/image.4067611750.8746/st,small,507x507-pad,600x600,f8f8f8.jpg',
        [
          'ex1',
          'ex2',
          'ex3',
          'ex4',
          'ex5',
          'ex6',
          'ex7',
          'ex8',
          'ex9',
          'ex10',
          'ex11',
          'ex12',
          'ex13',
          'ex14',
          'ex15',
          'ex16',
        ]
      ),
      (
        'Gym',
        40,
        'https://archives.bulbagarden.net/media/upload/1/15/Gym_Symbol.png',
        ['g1', 'gym1', 'gym2'],
      ),
      (
        'HeartGold and SoulSilver',
        50,
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2c173b0e-c605-462e-bdf0-8cb67da4e62e/d212ct7-04173f14-0e84-4c90-bfb3-52df0d1a4c1a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzJjMTczYjBlLWM2MDUtNDYyZS1iZGYwLThjYjY3ZGE0ZTYyZVwvZDIxMmN0Ny0wNDE3M2YxNC0wZTg0LTRjOTAtYmZiMy01MmRmMGQxYTRjMWEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.k0-JlDNtJfKw7F7CDPGtz6WGVFnwt_TXn5sAEGnGkFo',
        [
          'hgss1',
          'hgss2',
          'hgss3',
          'hgss4',
          'hgssp',
        ]
      ),
      (
        'Neo Genesis',
        70,
        'https://titancards.co.uk/cdn/shop/collections/9b6b1fc9fe0c872117a2023fdfda389c_1200x1133.jpg?v=1702480330',
        [
          'neo1',
          'neo2',
          'neo3',
          'neo4',
          'neop',
        ]
      ),
      (
        'Platinum',
        70,
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e8ddc4da-23dd-4502-b65b-378c9cfe5efa/dffqumj-8288ea0d-5f9c-4511-8349-06ec19dfec08.png/v1/fit/w_414,h_414/pokemon_platinum_logo_by_jormxdos_dffqumj-414w.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTI4MCIsInBhdGgiOiJcL2ZcL2U4ZGRjNGRhLTIzZGQtNDUwMi1iNjViLTM3OGM5Y2ZlNWVmYVwvZGZmcXVtai04Mjg4ZWEwZC01ZjljLTQ1MTEtODM0OS0wNmVjMTlkZmVjMDgucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.UlgnzgIqkg-LjDi2hvDnlCoo1zVu1CcR_QJIHuyg8Kw',
        [
          'pl1',
          'pl2',
          'pl3',
          'pl4',
        ]
      ),
      (
        'Sun & Moon',
        50,
        'https://s.yimg.com/ny/api/res/1.2/aQFzy9tibdhXBoLBqlCBYw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTc0NDtoPTU3MQ--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/479c7a3430ba99b3b0824b39eb128345',
        [
          'sm1',
          'sm2',
          'sm3',
          'sm4',
          'sm5',
          'sm6',
          'sm7',
          'sm8',
          'sm9',
          'sm10',
          'sm11',
          'sm12',
          'sm35',
          'sm75',
          'sm115',
          'sma',
          'smp',
        ],
      ),
      (
        'Sword & Shield',
        40,
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ47Im32WO4jnxtru-3xSjyolGEkft08ib6bQ&s',
        [
          'swsh1',
          'swsh2',
          'swsh3',
          'swsh4',
          'swsh5',
          'swsh6',
          'swsh7',
          'swsh8',
          'swsh9',
          'swsh9tg',
          'swsh10',
          'swsh10tg',
          'swsh11',
          'swsh11tg',
          'swsh12',
          'swsh12pt5',
          'swsh12pt5gg',
          'swsh12tg',
          'swsh35',
          'swsh45',
          'swsh45sv',
          'swshp',
        ],
      ),
      (
        'XY',
        70,
        'https://e7.pngegg.com/pngimages/877/621/png-clipart-pokemon-x-and-y-pokemon-bank-pokemon-ruby-and-sapphire-nintendo-3ds-nintendo-game-text.png',
        [
          'xy0',
          'xy1',
          'xy2',
          'xy3',
          'xy4',
          'xy5',
          'xy6',
          'xy7',
          'xy8',
          'xy9',
          'xy10',
          'xy11',
          'xy12',
          'xyp'
        ]
      ),
    ];

    final sellingPriceList = {
      'Common': 1.0,
      'Uncommon': 1.0,
      'Rare': 10.0,
      'Rare Holo': 15.0,
      'Rare Holo Ex': 20.0,
      'Rare Ultra': 25.0,
      'Rare Secret': 30.0,
      'Rare Break': 35.0,
      // How many rarities do we have?
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Survival'),
        actions: [
          Text('\$$wallet'),
          SizedBox(width: 8),
        ],
      ),
      body: GridView.builder(
        itemCount: packs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          final pack = packs[index];
          final name = pack.$1;
          final price = pack.$2;
          final imgUrl = pack.$3;

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name),
                  Text('\$$price'),
                ],
              ),
              Expanded(
                child: Card(
                  child: InkWell(
                    onTap: () {
                      if (wallet - price < 0) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text('You are broke...'),
                          ),
                        );
                        return;
                      }

                      // reduce wallet by $price:
                      wallet -= price;
                      setState(() {}); // refresh the screen

                      showDialog(
                        context: context,
                        builder: (context) => PkmTcgScreen(
                          packPaths: pack.$4,
                          onDraw: (totalValue) {
                            wallet += totalValue;
                            setState(() {});
                          },
                        ),
                      );
                    },
                    child: Image.network(imgUrl),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
