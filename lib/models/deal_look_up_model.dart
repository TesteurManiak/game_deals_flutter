class _DealLookUpInfo {
  final String storeID;
  final String gameID;
  final String name;
  final String? steamAppID;
  final double salePrice;
  final double retailPrice;
  final String? steamRatingText;
  final String? steamRatingPercent;
  final String? steamRatingCount;
  final String? metacriticScore;
  final String? metacriticLink;
  final DateTime? releaseDate;
  final String publisher;
  final String? steamworks;
  final String thumb;

  _DealLookUpInfo({
    required this.storeID,
    required this.gameID,
    required this.name,
    required this.steamAppID,
    required this.salePrice,
    required this.retailPrice,
    required this.steamRatingText,
    required this.steamRatingPercent,
    required this.steamRatingCount,
    required this.metacriticScore,
    required this.metacriticLink,
    required this.releaseDate,
    required this.publisher,
    required this.steamworks,
    required this.thumb,
  });

  factory _DealLookUpInfo.fromJson(Map<String, dynamic> json) =>
      _DealLookUpInfo(
        storeID: json['storeID'],
        gameID: json['gameID'],
        name: json['name'],
        steamAppID: json['steamAppID'],
        salePrice: double.parse(json['salePrice']),
        retailPrice: double.parse(json['retailPrice']),
        steamRatingText: json['steamRatingText'],
        steamRatingPercent: json['steamRatingPercent'],
        steamRatingCount: json['steamRatingCount'],
        metacriticScore: json['metacriticScore'],
        metacriticLink: json['metacriticLink'],
        releaseDate: json['releaseDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['releaseDate'] * 1000)
            : null,
        publisher: json['publisher'],
        steamworks: json['steamworks'],
        thumb: json['thumb'],
      );
}

class CheaperStore {
  final String dealID;
  final String storeID;
  final double salePrice;
  final double retailPrice;

  CheaperStore({
    required this.dealID,
    required this.storeID,
    required this.salePrice,
    required this.retailPrice,
  });

  factory CheaperStore.fromJson(Map<String, dynamic> json) => CheaperStore(
        dealID: json['dealID'],
        storeID: json['storeID'],
        salePrice: double.parse(json['salePrice']),
        retailPrice: double.parse(json['retailPrice']),
      );
}

class _CheapestPrice {
  final double price;
  final DateTime date;

  _CheapestPrice({required this.price, required this.date});

  factory _CheapestPrice.fromJson(Map<String, dynamic> json) => _CheapestPrice(
        price: double.parse(json['price']),
        date: DateTime.fromMillisecondsSinceEpoch(json['date'] * 1000),
      );
}

class DealLookUpModel {
  final _DealLookUpInfo info;
  final List<CheaperStore> cheaperStores;
  final _CheapestPrice cheapestPrice;

  DealLookUpModel({
    required this.info,
    required this.cheaperStores,
    required this.cheapestPrice,
  });

  factory DealLookUpModel.fromJson(Map<String, dynamic> json) =>
      DealLookUpModel(
        info: _DealLookUpInfo.fromJson(json['gameInfo']),
        cheaperStores: (json['cheaperStores'] as Iterable)
            .map<CheaperStore>((e) => CheaperStore.fromJson(e))
            .toList(),
        cheapestPrice: _CheapestPrice.fromJson(json['cheapestPrice']),
      );
}
