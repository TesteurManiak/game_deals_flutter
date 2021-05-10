import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/style/text_styles.dart';
import 'package:maniak_game_deals/ui/common/deal_icon.dart';

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
          Row(
            children: [
              Container(
                child: DealIcon(widget.deal),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: MyColors.shadow.withOpacity(0.5),
                      blurRadius: 4,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.deal.title,
                      style: TextStyles.dealTitle,
                    ),
                    if (widget.deal.dealRating != null)
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.deal.dealRating!.toStringAsFixed(1),
                              style: TextStyles.dealRating,
                            ),
                            TextSpan(
                              text: '/10',
                              style: TextStyles.dealRating2,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
