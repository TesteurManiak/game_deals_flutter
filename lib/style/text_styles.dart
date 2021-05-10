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
}
