import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/style/text_styles.dart';
import 'package:maniak_game_deals/ui/common/responsive.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/deal_card.dart';

class OtherDeals extends StatelessWidget {
  final double height;
  final List<DealModel>? deals;
  final String title;
  final VoidCallback seeAllCallback;

  const OtherDeals(
    this.title,
    this.deals,
    this.seeAllCallback, {
    this.height = 188,
  });

  @override
  Widget build(BuildContext context) {
    final double hPadding = Responsive.isMobile(context) ? 10 : 24;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: hPadding),
          child: Row(
            children: [
              Container(
                height: 20,
                width: 3,
                decoration: BoxDecoration(
                  color: MyColors.tabBarIndicator,
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              const SizedBox(width: 8),
              Text(title, style: TextStyles.categoryTitle),
              Expanded(child: Container()),
              TextButton(
                onPressed: seeAllCallback,
                child: const Text('See all'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: height,
          child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            scrollDirection: Axis.horizontal,
            itemCount: deals != null ? deals!.length : 0,
            itemBuilder: (_, index) => DealCard(deals![index]),
          ),
        ),
      ],
    );
  }
}
