class GameModel {
  final String gameID;
  final String? steamAppId;
  final double cheapest;
  final String cheapestDealID;
  final String gameExternal;
  final String internalName;
  final String thumb;

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
