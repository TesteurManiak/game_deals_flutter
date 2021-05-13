class _Info {
  final String title;
  final String? steamAppID;
  final String thumb;

  _Info({required this.title, required this.steamAppID, required this.thumb});

  factory _Info.fromJson(Map<String, dynamic> json) => _Info(
        title: json['title'],
        steamAppID: json['steamAppID'],
        thumb: json['thumb'],
      );
}

class _CheapestPriceEver {
  final double price;
  final DateTime date;

  _CheapestPriceEver({required this.price, required this.date});

  factory _CheapestPriceEver.fromJson(Map<String, dynamic> json) =>
      _CheapestPriceEver(
        price: double.parse(json['price']),
        date: DateTime.fromMillisecondsSinceEpoch(json['date'] * 1000),
      );
}

class AvailableDeal {
  final String storeID;
  final String dealID;
  final double price;
  final double retailPrice;
  final double savings;

  AvailableDeal({
    required this.storeID,
    required this.dealID,
    required this.price,
    required this.retailPrice,
    required this.savings,
  });

  factory AvailableDeal.fromJson(Map<String, dynamic> json) => AvailableDeal(
        storeID: json['storeID'],
        dealID: json['dealID'],
        price: double.parse(json['price']),
        retailPrice: double.parse(json['retailPrice']),
        savings: double.parse(json['savings']),
      );
}

class GameLookUpModel {
  final _Info info;
  final _CheapestPriceEver cheapestPriceEver;
  final List<AvailableDeal> deals;

  GameLookUpModel({
    required this.info,
    required this.cheapestPriceEver,
    required this.deals,
  });

  factory GameLookUpModel.fromJson(Map<String, dynamic> json) =>
      GameLookUpModel(
        info: _Info.fromJson(json['info']),
        cheapestPriceEver:
            _CheapestPriceEver.fromJson(json['cheapestPriceEver']),
        deals: (json['deals'] as Iterable)
            .map<AvailableDeal>((e) => AvailableDeal.fromJson(e))
            .toList(),
      );
}
