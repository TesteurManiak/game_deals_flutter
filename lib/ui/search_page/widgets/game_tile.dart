import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/game_model.dart';
import 'package:maniak_game_deals/ui/common/deal_icon.dart';
import 'package:maniak_game_deals/ui/game_page/game_page.dart';

class GameTile extends StatelessWidget {
  final GameModel gameModel;

  GameTile(this.gameModel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: DealIcon(
        gameModel.thumb,
        height: 50,
        width: 50,
        radius: 10,
      ),
      title: Text(gameModel.gameExternal),
      trailing: Text(
        '\$${gameModel.cheapest.toStringAsFixed(2)}',
      ),
      onTap: () => Navigator.pushNamed(
        context,
        GamePage.routeName,
        arguments: [gameModel.gameExternal, gameModel.gameID],
      ),
    );
  }
}
