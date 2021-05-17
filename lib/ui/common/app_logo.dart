import 'package:flutter/material.dart';
import 'package:maniak_game_deals/style/my_colors.dart';

class AppLogo extends StatelessWidget {
  final double avatarSize;
  final Color iconColor;
  final Color backgroundColor;
  final bool showTitle;

  const AppLogo({
    this.avatarSize = 50,
    this.backgroundColor = Colors.white,
    this.iconColor = MyColors.appLogo,
    this.showTitle = true,
  });

  factory AppLogo.small({
    double avatarSize = 20,
    Color backgroundColor = MyColors.appLogo,
    Color iconColor = Colors.white,
  }) =>
      AppLogo(
        avatarSize: avatarSize,
        backgroundColor: backgroundColor,
        iconColor: iconColor,
        showTitle: false,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          radius: avatarSize,
          child: Icon(
            Icons.gamepad,
            size: avatarSize,
            color: iconColor,
          ),
        ),
        if (showTitle) const SizedBox(height: 10),
        if (showTitle)
          const Text(
            'Game Store',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
      ],
    );
  }
}
