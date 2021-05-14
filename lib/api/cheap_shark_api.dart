import 'package:dio/dio.dart';
import 'package:maniak_game_deals/models/deal_look_up_model.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/models/game_look_up_model.dart';
import 'package:maniak_game_deals/models/game_model.dart';
import 'package:maniak_game_deals/models/sort_enum.dart';
import 'package:maniak_game_deals/models/store_model.dart';
import 'package:maniak_game_deals/utils/consts.dart';
import 'package:maniak_game_deals/extensions/extensions.dart'
    show DealSortModifier, BoolModifier;

class CheapSharkApiProvider {
  final Dio _dio;

  CheapSharkApiProvider(this._dio);

  Future<List<DealModel>> getDeals(
    List<String>? storeIds,
    int pageNumber,
    int pageSize,
    DealSort sortBy,
    bool desc,
    int lowerPrice,
    int upperPrice,
    int? metacritic,
    int? steamRating,
    String? steamAppID,
    String? title,
    bool exact,
    bool aaa,
    bool steamworks,
    bool onSale,
    String? output,
  ) async {
    assert(pageNumber >= 0);
    assert(pageSize <= 60 && pageSize > 0);
    assert(lowerPrice >= 0);
    assert(upperPrice <= 50 && upperPrice > 0);
    try {
      final queryParameters = <String, Object>{
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'sortBy': sortBy.string,
        'desc': desc.toInt(),
        'lowerPrice': lowerPrice,
        'upperPrice': upperPrice,
        'exact': exact.toInt(),
        'AAA': aaa.toInt(),
        'steamworks': steamworks.toInt(),
        'onSale': onSale.toInt(),
      };
      if (storeIds != null) {
        queryParameters['storeID'] = storeIds.join(',');
      }
      if (metacritic != null) {
        queryParameters['metacritic'] = metacritic;
      }
      if (steamRating != null) {
        queryParameters['steamRating'] = steamRating;
      }
      if (steamAppID != null) {
        queryParameters['steamAppID'] = steamAppID;
      }
      if (title != null) {
        queryParameters['title'] = title;
      }

      final response =
          await _dio.get(Endpoints.deals, queryParameters: queryParameters);
      return (response.data as Iterable)
          .map<DealModel>((e) => DealModel.fromJson(e, pageNumber))
          .toList();
    } catch (e) {
      throw 'getDeals: $e';
    }
  }

  Future<List<StoreModel>> getStores() async {
    try {
      final response = await _dio.get(Endpoints.stores);
      return (response.data as Iterable)
          .map<StoreModel>((e) => StoreModel.fromJson(e))
          .toList();
    } catch (e) {
      throw 'getStores: $e';
    }
  }

  Future getDealLookup(String dealId) async {
    try {
      final response =
          await _dio.get(Endpoints.deals, queryParameters: {'id': dealId});
      return response.data;
    } catch (e) {
      throw 'getDealLookup: $e';
    }
  }

  Future<List<GameModel>> getListOfGames({
    String? title,
    int? steamAppID,
    required int limit,
    required bool exact,
  }) async {
    assert(title != null || steamAppID != null);
    assert(limit >= 60 && limit > 0);
    try {
      final queryParameters = <String, dynamic>{
        'limit': limit,
        'exact': exact.toInt(),
      };
      if (steamAppID != null) queryParameters['steamAppID'] = steamAppID;
      if (title != null) queryParameters['title'] = title;
      final response =
          await _dio.get(Endpoints.games, queryParameters: queryParameters);
      return (response.data as Iterable)
          .map<GameModel>((e) => GameModel.fromJson(e))
          .toList();
    } catch (e) {
      throw 'getListOfGames: $e';
    }
  }

  Future<GameLookUpModel> getGameLookup(String gameID) async {
    try {
      final response =
          await _dio.get(Endpoints.games, queryParameters: {'id': gameID});
      return GameLookUpModel.fromJson(response.data);
    } catch (e) {
      throw 'getGameLookup: $e';
    }
  }

  Future<DealLookUpModel> getDealLookUp(String dealID) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'www.cheapshark.com',
        pathSegments: ['api', '1.0', 'deals'],
        query: 'id=$dealID',
      );
      final response = await _dio.getUri(uri);
      return DealLookUpModel.fromJson(response.data);
    } catch (e) {
      throw 'getDealLookUp: $e';
    }
  }
}
