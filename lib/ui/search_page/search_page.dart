import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/games_bloc.dart';
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

  late final GamesBloc _gamesBloc = BlocProvider.of<GamesBloc>(context);

  void _openFiltersDialog() {
    showDialog<bool>(context: context, builder: (_) => FiltersDialog())
        .then((value) {
      if (value == null || !value) {
        print('Dont update filters');
      } else {
        print('Update filters');
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
            hintText: 'Search',
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
