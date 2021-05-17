import 'package:flutter/material.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/ui/common/app_logo.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/home_content.dart';

class HomeWebLayout extends StatelessWidget {
  final List<BottomNavigationBarItem> items;

  const HomeWebLayout(this.items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            elevation: 4,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: MyColors.appLogo),
                  child: AppLogo(avatarSize: 40),
                ),
                ...items
                    .map<Widget>(
                      (e) => ListTile(
                        leading: e.icon,
                        title: Text(e.label!),
                        onTap: () {},
                      ),
                    )
                    .toList()
              ],
            ),
          ),
          Expanded(child: HomeContent()),
        ],
      ),
    );
  }
}
