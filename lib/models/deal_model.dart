import 'package:maniak_game_deals/extensions/extensions.dart'
    show StringModifier;

class DealModel {
  static const internalNameEntry = 'internalName';
  static const titleEntry = 'title';
  static const metacriticLinkEntry = 'metacriticLink';
  static const dealIDEntry = 'dealID';
  static const storeIDEntry = 'storeID';
  static const gameIDEntry = 'gameID';
  static const salePriceEntry = 'salePrice';
  static const normalPriceEntry = 'normalPrice';
  static const isOnSaleEntry = 'isOnSale';
  static const savingsEntry = 'savings';
  static const metacriticScoreEntry = 'metacriticScore';
  static const steamRatingTextEntry = 'steamRatingText';
  static const steamRatingPercentEntry = 'steamRatingPercent';
  static const steamRatingCountEntry = 'steamRatingCount';
  static const steamAppIDEntry = 'steamAppID';
  static const releaseDateEntry = 'releaseDate';
  static const lastChangeEntry = 'lastChange';
  static const dealRatingEntry = 'dealRating';
  static const thumbEntry = 'thumb';

  final String internalName;
  final String title;
  final String? metacriticLink;
  final String dealID;
  final String storeID;
  final String gameID;
  final double salePrice;
  final double normalPrice;
  final bool isOnSale;
  final double savings;
  final String? metacriticScore;
  final String? steamRatingText;
  final String? steamRatingPercent;
  final String? steamRatingCount;
  final String? steamAppID;
  final int? releaseDate;
  final int? lastChange;
  final double? dealRating;
  final String thumb;

  String get percentageOff => '${savings.round()}%';

  DealModel({
    required this.internalName,
    required this.title,
    required this.metacriticLink,
    required this.dealID,
    required this.storeID,
    required this.gameID,
    required this.salePrice,
    required this.normalPrice,
    required this.isOnSale,
    required this.savings,
    required this.metacriticScore,
    required this.steamRatingText,
    required this.steamRatingPercent,
    required this.steamRatingCount,
    required this.steamAppID,
    required this.releaseDate,
    required this.lastChange,
    required this.dealRating,
    required this.thumb,
  });

  factory DealModel.fromJson(json) => DealModel(
        internalName: json[internalNameEntry],
        title: json[titleEntry],
        metacriticLink: json[metacriticLinkEntry],
        dealID: json[dealIDEntry],
        storeID: json[storeIDEntry],
        gameID: json[gameIDEntry],
        salePrice: double.parse(json[salePriceEntry]),
        normalPrice: double.parse(json[normalPriceEntry]),
        isOnSale: json[isOnSaleEntry].toString().toBool(),
        savings: double.parse(json[savingsEntry]),
        metacriticScore: json[metacriticScoreEntry],
        steamRatingText: json[steamRatingTextEntry],
        steamRatingPercent: json[steamRatingPercentEntry],
        steamRatingCount: json[steamRatingCountEntry],
        steamAppID: json[steamAppIDEntry],
        releaseDate: json[releaseDateEntry],
        lastChange: json[lastChangeEntry],
        dealRating: double.tryParse(json[dealRatingEntry]) ?? null,
        thumb: json[thumbEntry],
      );
}