import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/deal_model.dart';

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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.deal.title),
          ],
        ),
      ),
    );
  }
}
