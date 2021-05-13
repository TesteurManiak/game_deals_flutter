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
        gameID: json['gameID'],
        steamAppId: json['steamAppID'],
        cheapest: double.parse(json['cheapest']),
        cheapestDealID: json['cheapestDealID'],
        gameExternal: json['external'],
        internalName: json['internalName'],
        thumb: json['thumb'],
      );
}
