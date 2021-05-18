import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/search_result.dart';
import 'package:maniak_game_deals/ui/common/deal_icon.dart';
import 'package:maniak_game_deals/ui/game_page/game_page.dart';

class SearchTile extends StatelessWidget {
  final SearchResult gameModel;

  const SearchTile(this.gameModel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: DealIcon(
        gameModel.thumb,
        height: 50,
        width: 50,
        radius: 10,
      ),
      title: Text(gameModel.title),
      trailing: Text(
        '\$${gameModel.price.toStringAsFixed(2)}',
      ),
      onTap: () => Navigator.pushNamed(
        context,
        GamePage.routeName,
        arguments: [gameModel.title, gameModel.gameID],
      ),
    );
  }
}
