import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/bloc/filters_bloc.dart';
import 'package:maniak_game_deals/bloc/games_bloc.dart';
import 'package:maniak_game_deals/bloc/stores_bloc.dart';
import 'package:maniak_game_deals/style/themes.dart';
import 'package:maniak_game_deals/ui/splash_page/splash_page.dart';
import 'package:maniak_game_deals/utils/router.dart';

void main() {
  runApp(
    BlocProvider(
      blocs: <BlocBase>[
        DealsBloc(),
        StoresBloc(),
        GamesBloc(),
        FiltersBloc(),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maniak Game Deals',
      theme: Themes.light,
      initialRoute: SplashPage.routeName,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
