import 'package:maniak_game_deals/extensions/extensions.dart'
    show StringModifier;

class StoreUri {
  static String steam(String steamAppID) => Uri(
        scheme: 'https',
        host: 'store.steampowered.com',
        pathSegments: ['app', steamAppID],
      ).toString();

  static String gamersGate(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.gamersgate.com',
        path: 'games',
        queryParameters: {
          'query': gameTitle.singleSpace().removeNonAlphNum(replaceBy: ' ')
        },
      ).toString();

  static String greenManGaming(String gameTitle) => Uri(
      scheme: 'https',
      host: 'www.greenmangaming.com',
      pathSegments: ['games', '${gameTitle.storeFormat()}-pc']).toString();

  static String origin(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.origin.com',
        path: 'search',
        queryParameters: {
          'searchString':
              gameTitle.singleSpace().removeNonAlphNum(replaceBy: ' ')
        },
      ).toString();

  static String gog(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.gog.com',
        pathSegments: ['game', gameTitle.storeFormat(replaceSpaceBy: '_')],
      ).toString();

  static String gamesplanet(String gameTitle) => Uri(
        scheme: 'https',
        host: 'us.gamesplanet.com',
        path: 'search',
        queryParameters: {
          'query': gameTitle.singleSpace().removeNonAlphNum(replaceBy: ' '),
        },
      ).toString();

  static String humbleBundle(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.humblebundle.com',
        pathSegments: ['store', gameTitle.storeFormat()],
      ).toString();

  static String winGame(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.wingamestore.com',
        path: 'search',
        queryParameters: {
          'SearchWord': gameTitle
              .toLowerCase()
              .singleSpace()
              .removeNonAlphNum(replaceBy: ' '),
        },
      ).toString();
}
