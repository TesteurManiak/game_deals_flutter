import 'package:maniak_game_deals/api/api_repository.dart';
import 'package:maniak_game_deals/bloc/bloc.dart';
import 'package:maniak_game_deals/models/game_model.dart';
import 'package:rxdart/rxdart.dart';

class GamesBloc extends BlocBase {
  final _gamesController = BehaviorSubject<List<GameModel>>.seeded([]);
  Stream<List<GameModel>> get onGamesChanged => _gamesController.stream;
  List<GameModel>? get games => _gamesController.value;

  @override
  void initState() {}

  @override
  void dispose() {
    _gamesController.close();
  }

  Future<void> fetchGames(String title) async {
    final fetchedGames = await apiRepository.getGames(title);
    _gamesController.sink.add(fetchedGames);
  }
}
