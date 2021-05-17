import 'package:maniak_game_deals/models/filters_actions_enum.dart';
import 'package:maniak_game_deals/models/filters_model.dart';

class FiltersResponse {
  final FiltersActions filtersActions;
  final FiltersModel? filtersModel;

  FiltersResponse({required this.filtersActions, required this.filtersModel});
}
