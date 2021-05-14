import 'package:flutter/material.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/style/text_styles.dart';

class Themes {
  static final _baseDark = ThemeData.dark();
  static final _baseLight = ThemeData.light();

  static ThemeData get dark {
    final _dark = _baseDark.copyWith();
    return _dark;
  }

  static ThemeData get light {
    final _light = _baseLight.copyWith(
      appBarTheme: _baseLight.appBarTheme.copyWith(
        backgroundColor: MyColors.appBar,
        textTheme: TextTheme(headline6: TextStyles.appBar),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      tabBarTheme: _baseLight.tabBarTheme.copyWith(
        labelColor: MyColors.tabBarLabel,
        unselectedLabelColor: MyColors.tabBarLabelUnselected,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: MyColors.tabBarIndicator,
            width: 3,
          ),
        ),
      ),
      bottomNavigationBarTheme: _baseLight.bottomNavigationBarTheme.copyWith(
        backgroundColor: MyColors.bottomNavBar,
        selectedItemColor: MyColors.bottomNavBarLabel,
        unselectedItemColor: MyColors.bottomNavBarLabelUnselected,
      ),
      scaffoldBackgroundColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: MyColors.textButton),
      ),
      dialogTheme: _baseLight.dialogTheme.copyWith(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    return _light;
  }
}
