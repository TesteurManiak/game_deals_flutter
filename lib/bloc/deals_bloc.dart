import 'package:maniak_game_deals/api/api_repository.dart';
import 'package:maniak_game_deals/bloc/bloc.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/models/sort_enum.dart';
import 'package:rxdart/rxdart.dart';

class DealsBloc implements BlocBase {
  final _bestDealsController = BehaviorSubject<List<DealModel>?>.seeded(null);
  Stream<List<DealModel>?> get onBestDealsChanged =>
      _bestDealsController.stream;
  List<DealModel>? get bestDeals => _bestDealsController.value;

  final _newestDealsController = BehaviorSubject<List<DealModel>?>.seeded(null);
  Stream<List<DealModel>?> get onRecentDealsChanged =>
      _newestDealsController.stream;
  List<DealModel>? get recentDeals => _newestDealsController.value;
  List<DealModel>? firstRecent(int length) {
    if (recentDeals != null && recentDeals!.length >= length) {
      return recentDeals!.sublist(0, length);
    } else {
      return recentDeals;
    }
  }

  final _cheapestDealsController =
      BehaviorSubject<List<DealModel>?>.seeded(null);
  Stream<List<DealModel>?> get onCheapestDealsChanged =>
      _cheapestDealsController.stream;
  List<DealModel>? get cheapestDeals => _cheapestDealsController.value;
  List<DealModel>? firstCheapest(int length) {
    if (cheapestDeals != null && cheapestDeals!.length >= length) {
      return cheapestDeals!.sublist(0, length);
    } else {
      return cheapestDeals;
    }
  }

  final _savingDealsController = BehaviorSubject<List<DealModel>?>.seeded(null);
  Stream<List<DealModel>?> get onSavingDealsChanged =>
      _savingDealsController.stream;
  List<DealModel>? get savingDeals => _savingDealsController.value;

  @override
  void dispose() {
    _cheapestDealsController.close();
    _bestDealsController.close();
    _newestDealsController.close();
    _savingDealsController.close();
  }

  @override
  void initState() {}

  Future<void> fetchBestDeals([int pageNumber = 0]) async {
    final newDeals =
        bestDeals != null ? List<DealModel>.from(bestDeals!) : <DealModel>[];
    final fetchedDeals = await apiRepository.getDeals(pageNumber: pageNumber);
    newDeals.addAll(fetchedDeals);
    _bestDealsController.sink.add(newDeals);
  }

  Future<void> fetchRecentDeals([int pageNumber = 0]) async {
    final newDeals = recentDeals != null
        ? List<DealModel>.from(recentDeals!)
        : <DealModel>[];
    final fetchedDeals = await apiRepository.getDeals(
      sortBy: DealSort.recent,
      pageNumber: pageNumber,
    );
    newDeals.addAll(fetchedDeals);
    _newestDealsController.sink.add(newDeals);
  }

  Future<void> fetchCheapestDeals([int pageNumber = 0]) async {
    final newDeals = cheapestDeals != null
        ? List<DealModel>.from(cheapestDeals!)
        : <DealModel>[];
    final fetchedDeals = await apiRepository.getDeals(
      sortBy: DealSort.price,
      pageNumber: pageNumber,
    );
    newDeals.addAll(fetchedDeals);
    _cheapestDealsController.sink.add(newDeals);
  }
}
