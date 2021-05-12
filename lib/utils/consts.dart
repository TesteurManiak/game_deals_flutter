import 'package:maniak_game_deals/extensions/extensions.dart'
    show StringModifier;

class Consts {
  static const dealsEndpoint = "https://www.cheapshark.com/api/1.0/deals";
  static const storesEndpoint = "https://www.cheapshark.com/api/1.0/stores";
  static const lookUpEndpoint =
      "https://www.cheapshark.com/api/1.0/deals?id={deal_id}";
  static final registeredHeroId = Set<String>();

  static const _storeUrls = <String, String>{
    '1': 'https://store.steampowered.com/app/{steam_id}/',
    '2': 'https://www.gamersgate.com/',
    '3': 'https://www.greenmangaming.com/games/{game_title}',
    '4': 'https://www.amazon.com/',
    '5': 'https://www.gamestop.com/',
    '6': 'https://www.direct2drive.com/',
    '7': 'https://www.gog.com/game/{game_title}',
    '8': 'https://www.origin.com/',
    '9': 'https://www.getgamesgo.com/',
    '10': 'https://shinyloot.com/',
    '11': 'https://www.humblebundle.com/store/{game_title}',
    '12': 'https://www.desura.com/',
    '13': 'https://store.ubi.com/',
    '14': 'http://indiegamestand.com/',
    '15': 'https://www.fanatical.com/',
    '16': 'https://us.gamesrocket.com/',
    '17': 'https://gamesrepublic.com/',
    '18': 'https://store.silagames.com/',
    '21': 'https://www.wingamestore.com/',
    '22': 'https://funstock.co.uk/',
    '23': 'https://www.gamebillet.com/',
    '24': 'https://www.voidu.com/',
    '25': 'https://www.epicgames.com/store/',
    '27': 'https://us.gamesplanet.com/',
    '28': 'https://www.gamesload.com/',
    '29': 'https://2game.com/',
    '30': 'https://www.indiegala.com/',
    '31': 'https://eu.shop.battle.net/',
    '32': 'https://www.allyouplay.com/',
  };

  static String? storeUrl(
      String storeId, String gameTitle, String? steamAppID) {
    if (steamAppID != null) {
      return _storeUrls[storeId]?.replaceFirst('{steam_id}', steamAppID);
    }
    switch (storeId) {
      case '3':
        return '${_storeUrls[storeId]?.replaceFirst('{game_title}', gameTitle.storeFormat())}-pc';
      case '7':
        return _storeUrls[storeId]?.replaceFirst(
            '{game_title}', gameTitle.storeFormat(replaceSpaceBy: '_'));
      default:
        return _storeUrls[storeId]
            ?.replaceFirst('{game_title}', gameTitle.storeFormat());
    }
  }
}
