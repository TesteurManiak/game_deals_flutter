import 'package:maniak_game_deals/api/api_repository.dart';
import 'package:maniak_game_deals/bloc/bloc.dart';
import 'package:maniak_game_deals/models/game_look_up_model.dart';
import 'package:maniak_game_deals/models/game_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:maniak_game_deals/extensions/extensions.dart'
    show StringModifier;

class GamesBloc extends BlocBase {
  final _lookedUpGameController =
      BehaviorSubject<GameLookUpModel?>.seeded(null);
  Stream<GameLookUpModel?> get onGameLookUpChanged =>
      _lookedUpGameController.stream;
  GameLookUpModel? get gameLookedUp => _lookedUpGameController.value;

  @override
  void initState() {}

  @override
  void dispose() {
    _lookedUpGameController.close();
  }

  Future<List<GameModel>> fetchGames(String title) async {
    late final List<GameModel> fetchedGames;
    if (title.isNumeric()) {
      final steamAppID = int.parse(title);
      fetchedGames = await apiRepository.getGames(steamAppID: steamAppID);
    } else {
      fetchedGames = await apiRepository.getGames(title: title);
    }
    return fetchedGames;
  }

  Future<void> gameLookup(String gameID) async {
    _lookedUpGameController.sink.add(null);
    final game = await apiRepository.getGameLookUp(gameID);
    _lookedUpGameController.sink.add(game);
  }
}
