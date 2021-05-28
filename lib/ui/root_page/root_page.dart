import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/navigation_bloc.dart';
import 'package:maniak_game_deals/ui/home_page/home_page.dart';

class RootPage extends StatelessWidget {
  static const routeName = '/app';
  @override
  Widget build(BuildContext context) {
    final _navigationBloc = BlocProvider.of<NavigationBloc>(context);
    return StreamBuilder<NavigationIndex>(
      stream: _navigationBloc.onIndexChanged,
      initialData: _navigationBloc.currentIndex,
      builder: (_, snapshot) {
        switch (snapshot.data!) {
          case NavigationIndex.wishlist:
          case NavigationIndex.profile:
          case NavigationIndex.home:
            return HomePage();
        }
      },
    );
  }
}
