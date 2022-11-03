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
        children: [
          Card(
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.network(
                    'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
                    width: 120,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text('Rick', style: TextStyle(fontSize: 22)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
