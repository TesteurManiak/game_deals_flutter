import 'package:flutter/material.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/ui/common/responsive.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double hPadding = Responsive.isMobile(context) ? 10 : 24;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          print('Navigate to search page');
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: hPadding),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: MyColors.appBar,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(Icons.search),
              const SizedBox(width: 8),
              Expanded(
                child: Text('Search for a game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
