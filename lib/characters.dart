import 'package:ecv_mobile_list_flutter/character_card.dart';
import 'package:flutter/material.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personnages'),
      ),
      body: ListView(
        children: const [
          CharacterCard(
            imageUrl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            title: 'Rick',
          ),
        ],
      ),
    );
  }
}
