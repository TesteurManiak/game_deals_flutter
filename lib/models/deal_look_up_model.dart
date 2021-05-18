class _GameInfo {
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

  _GameInfo({
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

  factory _GameInfo.fromJson(Map<String, dynamic> json) => _GameInfo(
        storeID: json['storeID'] as String,
        gameID: json['gameID'] as String,
        name: json['name'] as String,
        steamAppID: json['steamAppID'] as String?,
        salePrice: double.parse(json['salePrice'] as String),
        retailPrice: double.parse(json['retailPrice'] as String),
        steamRatingText: json['steamRatingText'] as String?,
        steamRatingPercent: json['steamRatingPercent'] as String?,
        steamRatingCount: json['steamRatingCount'] as String?,
        metacriticScore: json['metacriticScore'] as String?,
        metacriticLink: json['metacriticLink'] as String?,
        releaseDate: json['releaseDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                (json['releaseDate'] as int) * 1000)
            : null,
        publisher: json['publisher'] as String,
        steamworks: json['steamworks'] as String?,
        thumb: json['thumb'] as String,
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
        dealID: json['dealID'] as String,
        storeID: json['storeID'] as String,
        salePrice: double.parse(json['salePrice'] as String),
        retailPrice: double.parse(json['retailPrice'] as String),
      );
}

class _CheapestPrice {
  final double? price;
  final DateTime date;

  _CheapestPrice({required this.price, required this.date});

  factory _CheapestPrice.fromJson(Map<String, dynamic> json) => _CheapestPrice(
        price: json['price'] != null
            ? double.parse(json['price'] as String)
            : null,
        date: DateTime.fromMillisecondsSinceEpoch((json['date'] as int) * 1000),
      );
}

class DealLookUpModel {
  final _GameInfo gameInfo;
  final List<CheaperStore> cheaperStores;
  final _CheapestPrice cheapestPrice;

  DealLookUpModel({
    required this.gameInfo,
    required this.cheaperStores,
    required this.cheapestPrice,
  });

  factory DealLookUpModel.fromJson(Map<String, dynamic> json) =>
      DealLookUpModel(
        gameInfo: _GameInfo.fromJson(json['gameInfo'] as Map<String, dynamic>),
        cheaperStores: (json['cheaperStores'] as Iterable)
            .map<CheaperStore>(
                (e) => CheaperStore.fromJson(e as Map<String, dynamic>))
            .toList(),
        cheapestPrice: _CheapestPrice.fromJson(
            json['cheapestPrice'] as Map<String, dynamic>),
      );
}
