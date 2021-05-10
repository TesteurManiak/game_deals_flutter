import 'package:dio/dio.dart';
import 'package:maniak_game_deals/api/cheap_shark_api.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/models/sort_enum.dart';

class ApiRepository {
  final _dio = Dio();

  late CheapSharkApiProvider _cheapSharkApiProvider;

  ApiRepository() {
    _cheapSharkApiProvider = CheapSharkApiProvider(_dio);
  }

  Future<List<DealModel>> getDeals({
    List<String>? storeIds,
    int pageNumber = 0,
    int pageSize = 60,
    DealSort sortBy = DealSort.deal_rating,
    bool desc = false,
    int lowerPrice = 0,
    int upperPrice = 50,
    int? metacritic,
    int? steamRating,
    String? steamAppID,
    String? title,
    bool exact = false,
    bool aaa = false,
    bool steamworks = false,
    bool onSale = false,
    String? output,
  }) =>
      _cheapSharkApiProvider.getDeals(
        storeIds,
        pageNumber,
        pageSize,
        sortBy,
        desc,
        lowerPrice,
        upperPrice,
        metacritic,
        steamRating,
        steamAppID,
        title,
        exact,
        aaa,
        steamworks,
        onSale,
        output,
      );
}

final apiRepository = ApiRepository();