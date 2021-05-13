import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/games_bloc.dart';
import 'package:maniak_game_deals/models/game_look_up_model.dart';

class GamePage extends StatefulWidget {
  static const routeName = '/game';

  final String title;
  final String gameID;

  GamePage(this.title, this.gameID);

  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final GamesBloc _gamesBloc;

  @override
  void initState() {
    super.initState();
    _gamesBloc = BlocProvider.of<GamesBloc>(context);
    _gamesBloc.gameLookup(widget.gameID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<GameLookUpModel?>(
        stream: _gamesBloc.onGameLookUpChanged,
        builder: (_, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: const CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}
