class Consts {
  static const dealsEndpoint = "https://www.cheapshark.com/api/1.0/deals";
  static const storesEndpoint = "https://www.cheapshark.com/api/1.0/stores";
  static const lookUpEndpoint =
      "https://www.cheapshark.com/api/1.0/deals?id={deal_id}";
  static final registeredHeroId = Set<String>();

  static const _storeUrls = <String, String>{
    '1': 'https://store.steampowered.com/app/{steam_id}/',
    '2': 'https://www.gamersgate.com/',
    '3': 'https://www.greenmangaming.com/',
    '4': 'https://www.amazon.com/',
    '5': 'https://www.gamestop.com/',
    '6': 'https://www.direct2drive.com/',
  };

  static String? storeUrl(String storeId, String? steamAppID) =>
      steamAppID != null
          ? _storeUrls[storeId]?.replaceFirst('{steam_id}', steamAppID)
          : _storeUrls[storeId];
}
