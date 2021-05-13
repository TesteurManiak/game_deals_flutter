import 'package:maniak_game_deals/models/store_enum.dart';
import 'package:maniak_game_deals/utils/store_uri.dart';

class Endpoints {
  static const dealsEndpoint = "https://www.cheapshark.com/api/1.0/deals";
  static const storesEndpoint = "https://www.cheapshark.com/api/1.0/stores";
  static const lookUpEndpoint =
      "https://www.cheapshark.com/api/1.0/deals?id={deal_id}";
  static final registeredHeroId = Set<String>();

  static const _storeUrls = <StoreEnum, String>{
    StoreEnum.amazon: 'https://www.amazon.com/',
    StoreEnum.game_stop: 'https://www.gamestop.com/',
    StoreEnum.direct_2_drive: 'https://www.direct2drive.com/',
    StoreEnum.get_games_go: 'https://www.getgamesgo.com/',
    StoreEnum.shiny_loot: 'https://shinyloot.com/',
    StoreEnum.desura: 'https://www.desura.com/',
    StoreEnum.uplay: 'https://store.ubi.com/',
    StoreEnum.fanatical: 'https://www.fanatical.com/',
    StoreEnum.games_rocket: 'https://us.gamesrocket.com/',
    StoreEnum.games_republic: 'https://gamesrepublic.com/',
    StoreEnum.sila_games: 'https://store.silagames.com/',
    StoreEnum.funstock: 'https://funstock.co.uk/',
    StoreEnum.gamebillet: 'https://www.gamebillet.com/',
    StoreEnum.voidu: 'https://www.voidu.com/',
    StoreEnum.epic_games: 'https://www.epicgames.com/store/',
    StoreEnum.gamesload: 'https://www.gamesload.com/',
    StoreEnum.two_game: 'https://2game.com/',
    StoreEnum.indie_gala: 'https://www.indiegala.com/',
    StoreEnum.battle_net: 'https://eu.shop.battle.net/',
    StoreEnum.all_you_play: 'https://www.allyouplay.com/',
  };

  static String? storeUrl(
      StoreEnum? storeId, String gameTitle, String? steamAppID) {
    if (storeId == null) return null;
    if (storeId == StoreEnum.steam && steamAppID != null) {
      return StoreUri.steam(steamAppID);
    }
    switch (storeId) {
      case StoreEnum.gamers_gate:
        return StoreUri.gamersGate(gameTitle);
      case StoreEnum.green_man_gaming:
        return StoreUri.greenManGaming(gameTitle);
      case StoreEnum.origin:
        return StoreUri.origin(gameTitle);
      case StoreEnum.gog:
        return StoreUri.gog(gameTitle);
      case StoreEnum.gamesplanet:
        return StoreUri.gamesplanet(gameTitle);
      case StoreEnum.humble_bundle:
        return StoreUri.humbleBundle(gameTitle);
      case StoreEnum.win_game:
        return StoreUri.winGame(gameTitle);
      default:
        return _storeUrls[storeId];
    }
  }
}
