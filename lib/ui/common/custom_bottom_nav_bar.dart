import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/navigation_bloc.dart';
import 'package:maniak_game_deals/utils/consts.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationBloc = BlocProvider.of<NavigationBloc>(context);
    return BottomNavigationBar(
      items: Consts.navigationItems,
      currentIndex: navigationBloc.currentIndex.index,
      onTap: (index) => navigationBloc.goToPage(NavigationIndex.values[index]),
    );
  }
}
