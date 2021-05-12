import 'package:flutter/material.dart';
import 'package:maniak_game_deals/style/my_colors.dart';

class AppLogo extends StatelessWidget {
  final double avatarSize;

  const AppLogo({this.avatarSize = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: avatarSize,
            child: Icon(
              Icons.gamepad,
              size: avatarSize,
              color: MyColors.appLogo,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Game Store',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
