import 'package:flutter/material.dart';
import 'package:breaking_bad/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CharacterTile extends StatelessWidget {
  const CharacterTile({Key? key}) : super(key: key);

  Future<List<Character>>fetchBbCharacters() async{
    var data = await http.get(Uri.parse('https://breakingbadapi.com/api/characters'));
    List characters = jsonDecode(data.body);
    return characters.map((character) => Character.fromJson(character)).toList();

  }
  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(backgroundColor: Color(hashCode))
    );
  }
}