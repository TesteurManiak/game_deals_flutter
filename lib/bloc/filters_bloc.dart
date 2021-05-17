import 'package:maniak_game_deals/bloc/bloc.dart';
import 'package:maniak_game_deals/models/filters_model.dart';
import 'package:rxdart/rxdart.dart';

class FiltersBloc extends BlocBase {
  final _filtersController = BehaviorSubject<FiltersModel?>.seeded(null);
  Stream<FiltersModel?> get onFiltersChanged => _filtersController.stream;
  FiltersModel? get filters => _filtersController.value;

  @override
  void dispose() {
    _filtersController.close();
  }

  @override
  void initState() {}

  void resetFilters() => _filtersController.sink.add(null);

  void updateFilters(FiltersModel newFilters) =>
      _filtersController.sink.add(newFilters);
}
