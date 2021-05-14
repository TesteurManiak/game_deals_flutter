class StoreUri {
  static String steam(String steamAppID) => Uri(
        scheme: 'https',
        host: 'store.steampowered.com',
        pathSegments: ['app', steamAppID],
      ).toString();

  static String other(String dealID) => Uri(
        scheme: 'https',
        host: 'www.cheapshark.com',
        path: 'redirect',
        query: 'dealID=$dealID',
      ).toString();
}
