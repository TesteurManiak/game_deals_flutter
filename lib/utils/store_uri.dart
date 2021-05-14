class StoreUri {
  static String steam(String steamAppID) => Uri(
        scheme: 'https',
        host: 'store.steampowered.com',
        pathSegments: ['app', steamAppID],
      ).toString();
}
