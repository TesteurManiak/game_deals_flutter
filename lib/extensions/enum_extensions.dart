import 'package:maniak_game_deals/models/sort_enum.dart';

extension DealSortModifier on DealSort {
  String get string {
    switch (this) {
      case DealSort.dealRating:
        return 'Deal Rating';
      case DealSort.title:
        return 'Title';
      case DealSort.savings:
        return 'Savings';
      case DealSort.price:
        return 'Price';
      case DealSort.metacritic:
        return 'Metacritic';
      case DealSort.reviews:
        return 'Reviews';
      case DealSort.release:
        return 'Release';
      case DealSort.store:
        return 'Store';
      case DealSort.recent:
        return 'recent';
    }
  }
}
