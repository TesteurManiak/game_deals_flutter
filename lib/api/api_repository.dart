import 'package:dio/dio.dart';
import 'package:maniak_game_deals/api/cheap_shark_api.dart';
import 'package:maniak_game_deals/models/deal_look_up_model.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/models/game_look_up_model.dart';
import 'package:maniak_game_deals/models/game_model.dart';
import 'package:maniak_game_deals/models/sort_enum.dart';
import 'package:maniak_game_deals/models/store_model.dart';

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
    DealSort sortBy = DealSort.dealRating,
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
        aaa: aaa,
        desc: desc,
        exact: exact,
        lowerPrice: lowerPrice,
        metacritic: metacritic,
        onSale: onSale,
        output: output,
        pageNumber: pageNumber,
        pageSize: pageSize,
        sortBy: sortBy,
        steamAppID: steamAppID,
        steamRating: steamRating,
        steamworks: steamworks,
        storeIds: storeIds,
        title: title,
        upperPrice: upperPrice,
      );

  Future<DealLookUpModel> getDealLookUp(String dealID) =>
      _cheapSharkApiProvider.getDealLookUp(dealID);

  Future<List<StoreModel>> getStores() => _cheapSharkApiProvider.getStores();

  Future<List<GameModel>> getGames({
    String? title,
    int? steamAppID,
    int limit = 60,
    bool exact = false,
  }) =>
      _cheapSharkApiProvider.getListOfGames(
        title: title,
        steamAppID: steamAppID,
        limit: limit,
        exact: exact,
      );

  Future<GameLookUpModel> getGameLookUp(String gameID) =>
      _cheapSharkApiProvider.getGameLookup(gameID);
}

final apiRepository = ApiRepository();
