import 'package:maniak_game_deals/models/sort_enum.dart';
import 'package:maniak_game_deals/models/store_model.dart';

class FiltersModel {
  final StoreModel? store;
  final int results;
  final DealSort sortBy;
  final bool desc;

  FiltersModel({
    required this.store,
    required this.results,
    required this.sortBy,
    required this.desc,
  });
}
