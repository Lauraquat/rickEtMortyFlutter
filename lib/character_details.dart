import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CharacterDetailsPage extends StatefulWidget {
  final int id;
  final String imageUrl;

  const CharacterDetailsPage({
    super.key,
    required this.id,
    required this.imageUrl,
  });

  @override
  State<StatefulWidget> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  dynamic character;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final url = 'https://rickandmortyapi.com/api/character/${widget.id}';
    final apiResponse = await http.get(Uri.parse(url));
    final jsonCharacter = jsonDecode(apiResponse.body);
    setState(() {
      character = jsonCharacter;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (character == null) {
      content = Column(
        children: [
          Hero(
            tag: widget.imageUrl,
            child: Image.network(
              widget.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Center(child: CircularProgressIndicator()),
        ],
      );
    } else {
      content = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Hero(
          tag: character['image'],
          child: Image.network(
            character['image'],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(character['name'], style: const TextStyle(fontSize: 30)),
        )
      ]);
    }
    return Scaffold(body: content);
  }
}
