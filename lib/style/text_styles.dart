import 'package:flutter/material.dart';
import 'package:maniak_game_deals/style/my_colors.dart';

class TextStyles {
  static const appBar = TextStyle(
    color: MyColors.appBarText,
    fontSize: 26,
  );
  static const dealOverlay = TextStyle(color: Colors.white);
  static const categoryTitle = TextStyle(
    color: MyColors.appBarText,
    fontSize: 20,
  );
  static const dealCard = TextStyle(
    color: MyColors.dealCardTitle,
    fontSize: 12,
  );
  static const salePrice = TextStyle(color: MyColors.salePrice, fontSize: 12);
  static const normalPrice = TextStyle(
    color: MyColors.normalPrice,
    fontSize: 9,
  );
  static const dealTitle = TextStyle(fontSize: 24, color: MyColors.dealTitle);
  static const dealRating = TextStyle(color: MyColors.dealRating, fontSize: 14);
  static const dealRating2 = TextStyle(
    color: MyColors.dealRating2,
    fontSize: 9,
  );
  static const buyBtn = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );
  static const dealPagePrice = TextStyle(
    color: MyColors.dealPagePrice,
    fontSize: 16,
  );
  static const availableDealPrice = TextStyle(
    color: Colors.black,
    fontSize: 16,
  );
  static const availableDealPercentage = TextStyle(
    fontSize: 12,
    color: MyColors.salePrice,
  );
}
