import 'package:flutter/material.dart';
import 'package:maniak_game_deals/ui/search_page/search_page.dart';

class NavigatorHelper {
  static Future<T?> goToSearchPage<T extends Object?>(BuildContext context) =>
      Navigator.pushNamed<T>(context, SearchPage.routeName);
}
