import 'package:flutter/material.dart';
import 'package:maniak_game_deals/helper/navigator_helper.dart';
import 'package:maniak_game_deals/ui/common/app_logo.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/home_content.dart';

class HomeMobileLayout extends StatelessWidget {
  final List<BottomNavigationBarItem> items;

  const HomeMobileLayout(this.items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppLogo.small(),
        title: const Text('Game Store'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => NavigatorHelper.goToSearchPage(context),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: items),
      body: HomeContent(),
    );
  }
}
