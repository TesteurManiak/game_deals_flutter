import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/games_bloc.dart';
import 'package:maniak_game_deals/models/filters_actions_enum.dart';
import 'package:maniak_game_deals/models/game_model.dart';
import 'package:maniak_game_deals/ui/common/responsive.dart';
import 'package:maniak_game_deals/ui/search_page/widgets/filters_dialog.dart';
import 'package:maniak_game_deals/ui/search_page/widgets/game_tile.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();

  late final _gamesBloc = BlocProvider.of<GamesBloc>(context);

  void _openFiltersDialog() {
    showDialog<FiltersActions>(
        context: context, builder: (_) => FiltersDialog()).then((value) {
      switch (value) {
        case FiltersActions.filters:
          print('Update filters');
          break;
        case FiltersActions.reset:
          print('Reset filters');
          break;
        default:
          print('Dont update filters');
          break;
      }
    });
  }

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
          decoration: InputDecoration(
            hintText: 'Game name or Steam ID',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => _gamesBloc.fetchGames(_controller.text),
            ),
          ),
          onSubmitted: (value) => _gamesBloc.fetchGames(value),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: _openFiltersDialog,
          ),
        ],
      ),
      body: StreamBuilder<List<GameModel>?>(
        stream: _gamesBloc.onGamesChanged,
        builder: (streamContext, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: const CircularProgressIndicator());
          }
          if (snapshot.data!.isEmpty) {
            return Center(child: const Text('No game to display'));
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: Responsive.isMobile(streamContext) ? 10 : 24,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => GameTile(snapshot.data![index]),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
          );
        },
      ),
    );
  }
}
