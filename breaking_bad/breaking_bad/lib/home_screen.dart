
import 'package:flutter/material.dart';
import 'package:breaking_bad/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<List<Character>>fetchBbCharacters() async{
    var data = await http.get(Uri.parse('https://breakingbadapi.com/api/characters'));
    List characters = jsonDecode(data.body);
    return characters.map((character) => Character.fromJson(character)).toList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad Quotes'),
      ),
      body: FutureBuilder(
        future: fetchBbCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return GridView.builder();
          }
          if (snapshot.hasError){
              return Container(
                  child: Text('something.xyz',textAlign: TextAlign.center,),
                );
          }
        }

       )

    );
  }
}