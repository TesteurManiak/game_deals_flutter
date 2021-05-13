import 'package:maniak_game_deals/models/store_enum.dart';

extension StringModifier on String {
  bool toBool() {
    final val = int.tryParse(this) ?? null;
    return val != null && val > 0 ? true : false;
  }

  /// Return the `StoreEnum` corresponding to its `storeID`, this method will
  /// return `null` otherwise.
  StoreEnum? toStoreEnum() {
    switch (this) {
      case '1':
        return StoreEnum.steam;
      case '2':
        return StoreEnum.gamers_gate;
      case '3':
        return StoreEnum.green_man_gaming;
      case '4':
        return StoreEnum.amazon;
      case '5':
        return StoreEnum.game_stop;
      case '6':
        return StoreEnum.direct_2_drive;
      case '7':
        return StoreEnum.gog;
      case '8':
        return StoreEnum.origin;
      case '9':
        return StoreEnum.get_games_go;
      case '10':
        return StoreEnum.shiny_loot;
      case '11':
        return StoreEnum.humble_bundle;
      case '12':
        return StoreEnum.desura;
      case '13':
        return StoreEnum.uplay;
      case '15':
        return StoreEnum.fanatical;
      case '16':
        return StoreEnum.games_rocket;
      case '17':
        return StoreEnum.games_republic;
      case '18':
        return StoreEnum.sila_games;
      case '21':
        return StoreEnum.win_game;
      case '22':
        return StoreEnum.funstock;
      case '23':
        return StoreEnum.gamebillet;
      case '24':
        return StoreEnum.voidu;
      case '25':
        return StoreEnum.epic_games;
      case '27':
        return StoreEnum.gamesplanet;
      case '28':
        return StoreEnum.gamesload;
      case '29':
        return StoreEnum.two_game;
      case '30':
        return StoreEnum.indie_gala;
      case '31':
        return StoreEnum.battle_net;
      case '32':
        return StoreEnum.all_you_play;
      default:
        return null;
    }
  }

  String storeFormat({String replaceSpaceBy = '-'}) => this
      .replaceAll(RegExp("[^a-zA-Z0-9 -]"), '')
      .singleSpace()
      .replaceAll(' ', replaceSpaceBy)
      .toLowerCase()
      .trim();

  String singleSpace() => this.replaceAll(RegExp(' +'), ' ');

  String removeNonAlphNum({String replaceBy = ''}) =>
      this.replaceAll(RegExp("[^a-zA-Z0-9] "), replaceBy);
}
