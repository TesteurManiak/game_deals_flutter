import 'package:maniak_game_deals/models/sort_enum.dart';

extension DealSortModifier on DealSort {
  String get string => toString().split('.').last.replaceAll('_', ' ');
}
