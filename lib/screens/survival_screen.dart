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
        'https://www.antiquetrader.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc4MzQzODgwMDEyMzQyODkz/pokemon-sealed-record2.jpg'
      ),
      (
        'Black & White',
        80,
        'https://i0.wp.com/sixprizes.com/wp-content/uploads/pokemon-black-and-white-bw-logo-1.jpg?ssl=1'
      ),
      (
        'Colosseum',
        80,
        'https://archives.bulbagarden.net/media/upload/thumb/2/25/Colosseum_EN_boxart.png/250px-Colosseum_EN_boxart.png'
      ),
      (
        'Diamond & Pearl',
        70,
        'https://upload.wikimedia.org/wikipedia/en/7/71/Pok%C3%A9mon_Diamond_and_Pearl_logo.png'
      ),
      (
        'E-Card',
        10,
        'https://s3.pokeos.com/pokeos-uploads/tcg/eng/eseries.webp'
      ),
      (
        'EX',
        60,
        'https://ih1.redbubble.net/image.4067611750.8746/st,small,507x507-pad,600x600,f8f8f8.jpg'
      ),
      (
        'Gym',
        40,
        'https://archives.bulbagarden.net/media/upload/1/15/Gym_Symbol.png'
      ),
      (
        'HeartGold and SoulSilver',
        50,
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2c173b0e-c605-462e-bdf0-8cb67da4e62e/d212ct7-04173f14-0e84-4c90-bfb3-52df0d1a4c1a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzJjMTczYjBlLWM2MDUtNDYyZS1iZGYwLThjYjY3ZGE0ZTYyZVwvZDIxMmN0Ny0wNDE3M2YxNC0wZTg0LTRjOTAtYmZiMy01MmRmMGQxYTRjMWEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.k0-JlDNtJfKw7F7CDPGtz6WGVFnwt_TXn5sAEGnGkFo'
      ),
      (
        'Neo Genesis',
        70,
        'https://titancards.co.uk/cdn/shop/collections/9b6b1fc9fe0c872117a2023fdfda389c_1200x1133.jpg?v=1702480330'
      ),
      (
        'Platinum',
        70,
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e8ddc4da-23dd-4502-b65b-378c9cfe5efa/dffqumj-8288ea0d-5f9c-4511-8349-06ec19dfec08.png/v1/fit/w_414,h_414/pokemon_platinum_logo_by_jormxdos_dffqumj-414w.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTI4MCIsInBhdGgiOiJcL2ZcL2U4ZGRjNGRhLTIzZGQtNDUwMi1iNjViLTM3OGM5Y2ZlNWVmYVwvZGZmcXVtai04Mjg4ZWEwZC01ZjljLTQ1MTEtODM0OS0wNmVjMTlkZmVjMDgucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.UlgnzgIqkg-LjDi2hvDnlCoo1zVu1CcR_QJIHuyg8Kw'
      ),
      (
        'Sun & Moon',
        50,
        'https://s.yimg.com/ny/api/res/1.2/aQFzy9tibdhXBoLBqlCBYw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTc0NDtoPTU3MQ--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/479c7a3430ba99b3b0824b39eb128345'
      ),
      (
        'Sword & Shield',
        40,
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ47Im32WO4jnxtru-3xSjyolGEkft08ib6bQ&s'
      ),
      (
        'XY',
        70,
        'https://e7.pngegg.com/pngimages/877/621/png-clipart-pokemon-x-and-y-pokemon-bank-pokemon-ruby-and-sapphire-nintendo-3ds-nintendo-game-text.png'
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
                        builder: (context) => PkmTcgScreen(),
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
