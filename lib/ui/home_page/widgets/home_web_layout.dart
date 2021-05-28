import 'package:flutter/material.dart';
import 'package:maniak_game_deals/ui/common/custom_drawer.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/home_content.dart';

class HomeWebLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomDrawer(),
          Expanded(child: HomeContent()),
        ],
      ),
    );
  }
}
