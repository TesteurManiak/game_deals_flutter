import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/deal_display_model.dart';
import 'package:maniak_game_deals/ui/deal_page/deal_page.dart';
import 'package:maniak_game_deals/ui/game_page/game_page.dart';
import 'package:maniak_game_deals/ui/home_page/home_page.dart';
import 'package:maniak_game_deals/ui/search_page/search_page.dart';
import 'package:maniak_game_deals/ui/see_all_page/see_all_page.dart';
import 'package:maniak_game_deals/ui/splash_page/splash_page.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => HomePage());
      case SeeAllPage.routeName:
        final args = settings.arguments as List;
        return MaterialPageRoute(
            builder: (_) => SeeAllPage(args[0], args[1], args[2]));
      case DealPage.routeName:
        return MaterialPageRoute(
            builder: (_) => DealPage(settings.arguments as DealDisplayModel));
      case SearchPage.routeName:
        return MaterialPageRoute(builder: (_) => SearchPage());
      case GamePage.routeName:
        final args = settings.arguments as List;
        return MaterialPageRoute(builder: (_) => GamePage(args[0], args[1]));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
