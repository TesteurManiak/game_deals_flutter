import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/bloc/filters_bloc.dart';
import 'package:maniak_game_deals/bloc/games_bloc.dart';
import 'package:maniak_game_deals/models/filters_actions_enum.dart';
import 'package:maniak_game_deals/models/filters_response.dart';
import 'package:maniak_game_deals/models/search_result.dart';
import 'package:maniak_game_deals/ui/common/responsive.dart';
import 'package:maniak_game_deals/ui/search_page/widgets/filters_dialog.dart';
import 'package:maniak_game_deals/ui/search_page/widgets/search_tile.dart';
import 'package:async/async.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();

  late final _gamesBloc = BlocProvider.of<GamesBloc>(context);
  late final _dealsBloc = BlocProvider.of<DealsBloc>(context);
  late final _filtersBloc = BlocProvider.of<FiltersBloc>(context);
  late final _timer =
      RestartableTimer(const Duration(milliseconds: 500), _filterList);

  void _filterList([bool checkLength = true]) {
    if (checkLength && _controller.text.length < 3) return;
    if (_filtersBloc.filters != null) {
      _dealsBloc
          .fetchFilteredDeals(context, _controller.text)
          .then((value) => _filtersBloc.updateSearchResults(value));
    } else {
      _gamesBloc
          .fetchGames(_controller.text)
          .then((value) => _filtersBloc.updateSearchResults(value));
    }
  }

  void _openFiltersDialog() {
    showDialog<FiltersResponse>(
      context: context,
      builder: (_) => FiltersDialog(),
    ).then(
      (value) {
        if (value == null) return;
        switch (value.filtersActions) {
          case FiltersActions.filters:
            _filtersBloc.updateFilters(value.filtersModel!);
            _filterList(false);
            break;
          case FiltersActions.reset:
            _filtersBloc.resetFilters();
            _filterList(false);
            break;
          default:
            break;
        }
      },
    );
  }

  void _textfieldListener() => _timer.reset();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_textfieldListener);
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.removeListener(_textfieldListener);
    _controller.dispose();
    _filtersBloc.resetFilters(resetSearchResults: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Game name or Steam ID'),
          onSubmitted: (_) => _filterList(false),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: _openFiltersDialog,
          ),
        ],
      ),
      body: StreamBuilder<List<SearchResult>>(
        stream: _filtersBloc.onSearchResultChanged,
        builder: (streamContext, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.isEmpty) {
            return const Center(child: Text('No game to display'));
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: Responsive.isMobile(streamContext) ? 10 : 24,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => SearchTile(snapshot.data![index]),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
          );
        },
      ),
    );
  }
}
