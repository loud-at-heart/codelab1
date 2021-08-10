import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: RandomWord());
  }
}

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key}) : super(key: key);

  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final wordPair = WordPair.random();
  final _suggestions = <WordPair>[];

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (BuildContext _context, int i) {
      if (i.isOdd) return Divider();
      final int index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    },
    padding: const EdgeInsets.all(16),);
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(
      pair.asPascalCase,
      style: TextStyle(fontSize: 18),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Flutter"),
      ),
      body: Center(
        child: _buildSuggestions(),
      ),
    );
  }
}
