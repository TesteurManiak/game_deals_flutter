import 'package:flutter/material.dart';
import 'package:maniak_game_deals/ui/common/responsive.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/home_mobile_layout.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/home_web_layout.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HomeMobileLayout(),
      desktop: HomeWebLayout(),
    );
  }
}
