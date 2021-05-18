import 'package:maniak_game_deals/models/store_enum.dart';

extension StringModifier on String {
  bool toBool() {
    final val = int.tryParse(this);
    if (val != null && val > 0) return true;
    return false;
  }

  bool isNumeric() => int.tryParse(this) != null;

  /// Return the `StoreEnum` corresponding to its `storeID`, this method will
  /// return `null` otherwise.
  StoreEnum? toStoreEnum() {
    switch (this) {
      case '1':
        return StoreEnum.steam;
      case '2':
        return StoreEnum.gamersGate;
      case '3':
        return StoreEnum.greenManGaming;
      case '4':
        return StoreEnum.amazon;
      case '5':
        return StoreEnum.gameStop;
      case '6':
        return StoreEnum.direct2Drive;
      case '7':
        return StoreEnum.gog;
      case '8':
        return StoreEnum.origin;
      case '9':
        return StoreEnum.getGamesGo;
      case '10':
        return StoreEnum.shinyloot;
      case '11':
        return StoreEnum.humbleBundle;
      case '12':
        return StoreEnum.desura;
      case '13':
        return StoreEnum.uplay;
      case '15':
        return StoreEnum.fanatical;
      case '16':
        return StoreEnum.gamesRocket;
      case '17':
        return StoreEnum.gamesRepublic;
      case '18':
        return StoreEnum.silaGames;
      case '21':
        return StoreEnum.winGame;
      case '22':
        return StoreEnum.funstock;
      case '23':
        return StoreEnum.gamebillet;
      case '24':
        return StoreEnum.voidu;
      case '25':
        return StoreEnum.epicGames;
      case '27':
        return StoreEnum.gamesplanet;
      case '28':
        return StoreEnum.gamesload;
      case '29':
        return StoreEnum.twoGames;
      case '30':
        return StoreEnum.indieGala;
      case '31':
        return StoreEnum.battleNet;
      case '32':
        return StoreEnum.allYouPlay;
      default:
        return null;
    }
  }

  String singleSpace() => replaceAll(RegExp(' +'), ' ');

  String removeNonAlphNum({String replaceBy = ''}) =>
      replaceAll(RegExp("[^a-zA-Z0-9] "), replaceBy);

  String removeLastChar() => substring(0, length - 1);

  String capitalizeFirstChar() => this[0].toUpperCase() + substring(1);
}
