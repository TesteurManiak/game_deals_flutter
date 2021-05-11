import 'package:flutter/material.dart';
import 'package:maniak_game_deals/style/my_colors.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: MyColors.progressIndicator),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(),
                      ],
                    ),
                  ),
                  flex: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
