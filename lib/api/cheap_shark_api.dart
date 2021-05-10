import 'package:dio/dio.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/models/sort_enum.dart';
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

      final response = await _dio.get(
        Consts.dealsEndpoint,
        queryParameters: queryParameters,
      );
      return (response.data as Iterable)
          .map<DealModel>((e) => DealModel.fromJson(e))
          .toList();
    } catch (e) {
      throw 'getDeals: $e';
    }
  }
}
