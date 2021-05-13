import 'package:maniak_game_deals/models/deal_model.dart';

class DealDisplayModel {
  final String dealID;
  final String thumb;
  final String? uid;
  final String storeID;
  final String title;
  final double? dealRating;

  DealDisplayModel({
    required this.dealID,
    required this.thumb,
    this.uid,
    required this.storeID,
    required this.title,
    this.dealRating,
  });

  factory DealDisplayModel.fromDealModel(DealModel dealModel) =>
      DealDisplayModel(
        dealID: dealModel.dealID,
        thumb: dealModel.thumb,
        storeID: dealModel.storeID,
        title: dealModel.title,
        uid: dealModel.uid,
        dealRating: dealModel.dealRating,
      );
}
