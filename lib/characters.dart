import 'dart:convert';
import 'package:ecv_mobile_list_flutter/character_card.dart';
import 'package:ecv_mobile_list_flutter/character_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});
  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  List<dynamic> characters = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final apiResponse =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    final json = jsonDecode(apiResponse.body);
    final List<dynamic> jsonCharacters = json['results'];
    setState(() {
      characters = jsonCharacters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personnages'),
      ),
      body: ListView(
        children: characters
            .map((e) => InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CharacterDetailsPage(
                        id: e["id"] as int,
                        imageUrl: e['image'] as String,
                      ),
                    ),
                  );
                },
                child: CharacterCard(
                  imageUrl: e['image'] as String,
                  title: e['name'] as String,
                  isAlive: e['status'] == 'Alive',
                )))
            .toList(),
      ),
    );
  }
}
