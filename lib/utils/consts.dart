import 'package:maniak_game_deals/extensions/extensions.dart'
    show StringModifier;
import 'package:maniak_game_deals/models/store_enum.dart';

class Consts {
  static const dealsEndpoint = "https://www.cheapshark.com/api/1.0/deals";
  static const storesEndpoint = "https://www.cheapshark.com/api/1.0/stores";
  static const lookUpEndpoint =
      "https://www.cheapshark.com/api/1.0/deals?id={deal_id}";
  static final registeredHeroId = Set<String>();

  static const _storeUrls = <StoreEnum, String>{
    StoreEnum.steam: 'https://store.steampowered.com/app/{steam_id}/',
    StoreEnum.green_man_gaming:
        'https://www.greenmangaming.com/games/{game_title}',
    StoreEnum.amazon: 'https://www.amazon.com/',
    StoreEnum.game_stop: 'https://www.gamestop.com/',
    StoreEnum.direct_2_drive: 'https://www.direct2drive.com/',
    StoreEnum.gog: 'https://www.gog.com/game/{game_title}',
    StoreEnum.origin: 'https://www.origin.com/',
    StoreEnum.get_games_go: 'https://www.getgamesgo.com/',
    StoreEnum.shiny_loot: 'https://shinyloot.com/',
    StoreEnum.humble_bundle: 'https://www.humblebundle.com/store/{game_title}',
    StoreEnum.desura: 'https://www.desura.com/',
    StoreEnum.uplay: 'https://store.ubi.com/',
    StoreEnum.fanatical: 'https://www.fanatical.com/',
    StoreEnum.games_rocket: 'https://us.gamesrocket.com/',
    StoreEnum.games_republic: 'https://gamesrepublic.com/',
    StoreEnum.sila_games: 'https://store.silagames.com/',
    StoreEnum.win_game: 'https://www.wingamestore.com/',
    StoreEnum.funstock: 'https://funstock.co.uk/',
    StoreEnum.gamebillet: 'https://www.gamebillet.com/',
    StoreEnum.voidu: 'https://www.voidu.com/',
    StoreEnum.epic_games: 'https://www.epicgames.com/store/',
    StoreEnum.gamesplanet: 'https://us.gamesplanet.com/',
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
      return _storeUrls[storeId]?.replaceFirst('{steam_id}', steamAppID);
    }
    switch (storeId) {
      case StoreEnum.gamers_gate:
        return Uri(
          scheme: 'https',
          host: 'www.gamersgate.com',
          path: 'games',
          queryParameters: {
            'query': gameTitle.singleSpace().removeNonAlphNum(replaceBy: ' ')
          },
        ).toString();
      case StoreEnum.green_man_gaming:
        return '${_storeUrls[storeId]?.replaceFirst('{game_title}', gameTitle.storeFormat())}-pc';
      case StoreEnum.gog:
        return _storeUrls[storeId]?.replaceFirst(
            '{game_title}', gameTitle.storeFormat(replaceSpaceBy: '_'));
      case StoreEnum.gamesplanet:
        return Uri(
          scheme: 'https',
          host: 'us.gamesplanet.com',
          path: 'search',
          queryParameters: {
            'query': gameTitle.singleSpace().removeNonAlphNum(replaceBy: ' '),
          },
        ).toString();
      default:
        return _storeUrls[storeId]
            ?.replaceFirst('{game_title}', gameTitle.storeFormat());
    }
  }
}
