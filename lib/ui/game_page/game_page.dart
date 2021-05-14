import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/games_bloc.dart';
import 'package:maniak_game_deals/models/game_look_up_model.dart';
import 'package:maniak_game_deals/ui/game_page/widgets/available_deal_tile.dart';

class GamePage extends StatefulWidget {
  static const routeName = '/game';

  final String title;
  final String gameID;

  GamePage(this.title, this.gameID);

  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final _gamesBloc = BlocProvider.of<GamesBloc>(context)
    ..gameLookup(widget.gameID);

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
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Available Deals'),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.deals.length,
                    itemBuilder: (_, index) => AvailableDealTile(
                      availableDeal: snapshot.data!.deals[index],
                      thumb: snapshot.data!.info.thumb,
                      title: snapshot.data!.info.title,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
