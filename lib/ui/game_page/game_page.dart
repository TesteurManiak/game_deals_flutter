import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  static const routeName = '/game';

  final String title;
  final String gameID;

  GamePage(this.title, this.gameID);

  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
