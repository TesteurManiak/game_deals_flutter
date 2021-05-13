import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/games_bloc.dart';
import 'package:maniak_game_deals/models/game_model.dart';
import 'package:maniak_game_deals/ui/common/deal_icon.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();

  late final GamesBloc _gamesBloc = BlocProvider.of<GamesBloc>(context);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Search'),
          onSubmitted: (value) => _gamesBloc.fetchGames(value),
        ),
      ),
      body: StreamBuilder<List<GameModel>>(
        stream: _gamesBloc.onGamesChanged,
        builder: (_, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          if (snapshot.data!.isEmpty) return const Text('No game to display');
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => ListTile(
              leading: DealIcon(
                snapshot.data![index].thumb,
                height: 50,
                width: 50,
                radius: 10,
              ),
              title: Text(snapshot.data![index].gameExternal),
              trailing: Text(
                '\$${snapshot.data![index].cheapest.toStringAsFixed(2)}',
              ),
              onTap: () {},
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
          );
        },
      ),
    );
  }
}
