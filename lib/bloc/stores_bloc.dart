import 'package:maniak_game_deals/api/api_repository.dart';
import 'package:maniak_game_deals/bloc/bloc.dart';
import 'package:maniak_game_deals/models/store_model.dart';
import 'package:rxdart/rxdart.dart';

class StoresBloc extends BlocBase {
  final _storesController = BehaviorSubject<List<StoreModel>?>.seeded(null);
  Stream<List<StoreModel>?> get onStoresChanged => _storesController.stream;
  List<StoreModel>? get stores => _storesController.value;

  @override
  void initState() {}

  @override
  void dispose() {
    _storesController.close();
  }

  Future<void> fetchStores() async {
    final fetchedStores = await apiRepository.getStores();
    _storesController.sink.add(fetchedStores);
  }
}
