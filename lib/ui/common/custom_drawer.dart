import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/navigation_bloc.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/ui/common/app_logo.dart';
import 'package:maniak_game_deals/utils/consts.dart';

class CustomDrawer extends StatelessWidget {
  bool _isSelected(int index, int selectedIndex) => index == selectedIndex;

  @override
  Widget build(BuildContext context) {
    final navigationBloc = BlocProvider.of<NavigationBloc>(context);
    return Drawer(
      elevation: 4,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: MyColors.appLogo),
            child: AppLogo(avatarSize: 40),
          ),
          ...Consts.navigationItems.map<Widget>(
            (e) {
              final index = Consts.navigationItems.indexOf(e);
              final selected =
                  _isSelected(index, navigationBloc.currentIndex.index);
              return ListTile(
                leading: IconTheme(
                  data: IconThemeData(
                    color: selected
                        ? MyColors.bottomNavBarLabel
                        : MyColors.bottomNavBarLabelUnselected,
                  ),
                  child: e.icon,
                ),
                title: Text(
                  e.label!,
                  style: TextStyle(
                    color: selected
                        ? MyColors.bottomNavBarLabel
                        : MyColors.bottomNavBarLabelUnselected,
                  ),
                ),
                onTap: () =>
                    navigationBloc.goToPage(NavigationIndex.values[index]),
              );
            },
          ).toList()
        ],
      ),
    );
  }
}
