import 'package:maniak_game_deals/api/api_repository.dart';
import 'package:maniak_game_deals/bloc/bloc.dart';
import 'package:maniak_game_deals/models/game_look_up_model.dart';
import 'package:maniak_game_deals/models/game_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:maniak_game_deals/extensions/extensions.dart'
    show StringModifier;

class GamesBloc extends BlocBase {
  final _gamesController = BehaviorSubject<List<GameModel>?>.seeded([]);
  Stream<List<GameModel>?> get onGamesChanged => _gamesController.stream;
  List<GameModel>? get games => _gamesController.value;

  final _lookedUpGameController =
      BehaviorSubject<GameLookUpModel?>.seeded(null);
  Stream<GameLookUpModel?> get onGameLookUpChanged =>
      _lookedUpGameController.stream;
  GameLookUpModel? get gameLookedUp => _lookedUpGameController.value;

  @override
  void initState() {}

  @override
  void dispose() {
    _gamesController.close();
    _lookedUpGameController.close();
  }

  Future<void> fetchGames(String title) async {
    _gamesController.sink.add(null);
    late final List<GameModel> fetchedGames;
    if (title.isNumeric()) {
      final steamAppID = int.parse(title);
      fetchedGames = await apiRepository.getGames(steamAppID: steamAppID);
    } else {
      fetchedGames = await apiRepository.getGames(title: title);
    }
    _gamesController.sink.add(fetchedGames);
  }

  Future<void> gameLookup(String gameID) async {
    _lookedUpGameController.sink.add(null);
    final game = await apiRepository.getGameLookUp(gameID);
    _lookedUpGameController.sink.add(game);
  }
}
