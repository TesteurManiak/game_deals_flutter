import 'package:maniak_game_deals/models/search_result.dart';

class GameModel extends SearchResult {
  final String? steamAppId;
  final double cheapest;
  final String cheapestDealID;
  final String gameExternal;
  final String internalName;

  @override
  final String gameID;

  @override
  final String thumb;

  @override
  String get title => gameExternal;

  @override
  double get price => cheapest;

  GameModel({
    required this.gameID,
    required this.steamAppId,
    required this.cheapest,
    required this.cheapestDealID,
    required this.gameExternal,
    required this.internalName,
    required this.thumb,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        gameID: json['gameID'] as String,
        steamAppId: json['steamAppID'] as String?,
        cheapest: double.parse(json['cheapest'] as String),
        cheapestDealID: json['cheapestDealID'] as String,
        gameExternal: json['external'] as String,
        internalName: json['internalName'] as String,
        thumb: json['thumb'] as String,
      );
}
