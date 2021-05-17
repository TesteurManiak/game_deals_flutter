import 'dart:math';

import 'package:maniak_game_deals/extensions/extensions.dart'
    show StringModifier;
import 'package:maniak_game_deals/utils/consts.dart';

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
  final DateTime? releaseDate;
  final DateTime? lastChange;
  final double? dealRating;
  final String thumb;
  final int pageNumber;

  late int _id;

  String get percentageOff => '${savings.round()}%';
  String get uid => '$dealID-$internalName-$title-$_id';

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
    required this.pageNumber,
  }) {
    final random = Random();
    _id = random.nextInt(1000000);
    while (Endpoints.registeredHeroId.contains(_id)) {
      _id = random.nextInt(1000000);
    }
    Endpoints.registeredHeroId.add(_id);
  }

  factory DealModel.fromJson(json, int pageNumber) => DealModel(
        internalName: json[internalNameEntry] as String,
        title: json[titleEntry] as String,
        metacriticLink: json[metacriticLinkEntry] as String?,
        dealID: json[dealIDEntry] as String,
        storeID: json[storeIDEntry] as String,
        gameID: json[gameIDEntry] as String,
        salePrice: double.parse(json[salePriceEntry] as String),
        normalPrice: double.parse(json[normalPriceEntry] as String),
        isOnSale: json[isOnSaleEntry].toString().toBool(),
        savings: double.parse(json[savingsEntry] as String),
        metacriticScore: json[metacriticScoreEntry] as String?,
        steamRatingText: json[steamRatingTextEntry] as String?,
        steamRatingPercent: json[steamRatingPercentEntry] as String?,
        steamRatingCount: json[steamRatingCountEntry] as String?,
        steamAppID: json[steamAppIDEntry] as String?,
        releaseDate: json[releaseDateEntry] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                (json[releaseDateEntry] as int) * 1000)
            : null,
        lastChange: json[lastChangeEntry] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                (json[lastChangeEntry] as int) * 1000)
            : null,
        dealRating: json[dealRatingEntry] != null
            ? double.tryParse(json[dealRatingEntry] as String)
            : null,
        thumb: json[thumbEntry] as String,
        pageNumber: pageNumber,
      );
}
