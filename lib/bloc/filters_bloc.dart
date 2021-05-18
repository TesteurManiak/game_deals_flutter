import 'package:maniak_game_deals/bloc/bloc.dart';
import 'package:maniak_game_deals/models/filters_model.dart';
import 'package:maniak_game_deals/models/search_result.dart';
import 'package:rxdart/rxdart.dart';

class FiltersBloc extends BlocBase {
  final _filtersController = BehaviorSubject<FiltersModel?>.seeded(null);
  Stream<FiltersModel?> get onFiltersChanged => _filtersController.stream;
  FiltersModel? get filters => _filtersController.value;

  final _searchResultsController =
      BehaviorSubject<List<SearchResult>>.seeded([]);
  Stream<List<SearchResult>> get onSearchResultChanged =>
      _searchResultsController.stream;
  List<SearchResult>? get searchResults => _searchResultsController.value;

  @override
  void dispose() {
    _filtersController.close();
    _searchResultsController.close();
  }

  @override
  void initState() {}

  void resetFilters({bool resetSearchResults = false}) {
    _filtersController.sink.add(null);
    if (resetSearchResults) _searchResultsController.sink.add([]);
  }

  void updateFilters(FiltersModel newFilters) =>
      _filtersController.sink.add(newFilters);

  void updateSearchResults(List<SearchResult> results) =>
      _searchResultsController.sink.add(results);
}
