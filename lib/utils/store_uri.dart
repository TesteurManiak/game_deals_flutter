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
          'query': gameTitle.removeNonAlphNum(replaceBy: ' ').singleSpace()
        },
      ).toString();

  static String greenManGaming(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.greenmangaming.com',
        pathSegments: [
          'search',
          gameTitle
              .toLowerCase()
              .removeNonAlphNum(replaceBy: ' ')
              .singleSpace(),
        ],
      ).toString();

  static String origin(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.origin.com',
        path: 'search',
        queryParameters: {
          'searchString':
              gameTitle.removeNonAlphNum(replaceBy: ' ').singleSpace()
        },
      ).toString();

  static String gog(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.gog.com',
        pathSegments: [
          'game',
          gameTitle
              .toLowerCase()
              .replaceAll("'", '')
              .removeNonAlphNum(replaceBy: ' ')
              .singleSpace()
              .trim()
              .replaceAll(' ', '_'),
        ],
      ).toString().replaceAll('+', '%20');

  static String gamesplanet(String gameTitle) => Uri(
        scheme: 'https',
        host: 'us.gamesplanet.com',
        path: 'search',
        queryParameters: {
          'query': gameTitle.removeNonAlphNum(replaceBy: ' ').singleSpace(),
        },
      ).toString();

  static String humbleBundle(String gameTitle) =>
      Uri(scheme: 'https', host: 'www.humblebundle.com', pathSegments: [
        'store',
        'search'
      ], queryParameters: {
        'search': gameTitle
            .toLowerCase()
            .removeNonAlphNum(replaceBy: ' ')
            .singleSpace(),
      }).toString();

  static String winGame(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.wingamestore.com',
        path: 'search',
        queryParameters: {
          'SearchWord': gameTitle
              .toLowerCase()
              .removeNonAlphNum(replaceBy: ' ')
              .singleSpace(),
        },
      ).toString();

  static String indieGala(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.indiegala.com',
        pathSegments: [
          'search',
          gameTitle
              .toLowerCase()
              .removeNonAlphNum(replaceBy: ' ')
              .singleSpace(),
        ],
      ).toString();

  static String epicGames(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.epicgames.com',
        pathSegments: ['store', 'browse'],
        queryParameters: {
          'q': gameTitle
              .toLowerCase()
              .removeNonAlphNum(replaceBy: ' ')
              .singleSpace(),
        },
      ).toString();

  static String fanatical(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.fanatical.com',
        path: 'search',
        queryParameters: {
          'search': gameTitle
              .toLowerCase()
              .removeNonAlphNum(replaceBy: ' ')
              .singleSpace(),
        },
      ).toString();

  static String gamebillet(String gameTitle) => Uri(
        scheme: 'https',
        host: 'www.gamebillet.com',
        path: gameTitle
            .toLowerCase()
            .removeNonAlphNum(replaceBy: ' ')
            .singleSpace()
            .replaceAll(' ', '-'),
      ).toString();

  static String battleNet(String gameTitle) =>
      Uri(scheme: 'https', host: 'eu.shop.battle.net', pathSegments: [
        'product',
        gameTitle
            .toLowerCase()
            .removeNonAlphNum(replaceBy: ' ')
            .singleSpace()
            .replaceAll(' ', '-'),
      ]).toString();
}