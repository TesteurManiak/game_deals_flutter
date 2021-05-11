import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/ui/deal_page/widgets/buy_btn.dart';
import 'package:maniak_game_deals/ui/deal_page/widgets/game_header.dart';

class DealPage extends StatefulWidget {
  static const routeName = '/deal';

  final DealModel deal;

  DealPage(this.deal);

  @override
  State<StatefulWidget> createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: MyColors.appBarActions,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GameHeader(widget.deal),
          const SizedBox(height: 32),
          BuyBtn(widget.deal),
        ],
      ),
    );
  }
}
