import 'package:flutter/material.dart';
import 'package:maniak_game_deals/ui/common/responsive.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/home_mobile_layout.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/home_web_layout.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  final _bottom = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Whishlist'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HomeMobileLayout(_bottom),
      desktop: HomeWebLayout(_bottom),
    );
  }
}
