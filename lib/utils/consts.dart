import 'package:maniak_game_deals/models/store_enum.dart';
import 'package:maniak_game_deals/utils/store_uri.dart';

class Endpoints {
  static const deals = 'https://www.cheapshark.com/api/1.0/deals';
  static const stores = 'https://www.cheapshark.com/api/1.0/stores';
  static const games = 'https://www.cheapshark.com/api/1.0/games';

  static final registeredHeroId = <int>{};

  static String? storeUrl({
    StoreEnum? storeId,
    required String dealID,
    String? steamAppID,
  }) {
    if (storeId == null) return null;
    if (storeId == StoreEnum.steam && steamAppID != null) {
      return StoreUri.steam(steamAppID);
    }
    return StoreUri.other(dealID);
  }
}
