import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/style/themes.dart';
import 'package:maniak_game_deals/ui/home_page/home_page.dart';
import 'package:maniak_game_deals/utils/router.dart';

void main() {
  runApp(BlocProvider(
    child: MyApp(),
    blocs: <BlocBase>[
      DealsBloc(),
    ],
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maniak Game Deals',
      theme: Themes.light,
      initialRoute: HomePage.routeName,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
