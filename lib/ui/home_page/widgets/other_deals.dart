import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/style/text_styles.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/deal_card.dart';

class OtherDeals extends StatelessWidget {
  final double height;
  final List<DealModel>? deals;
  final String title;
  final VoidCallback seeAllCallback;

  OtherDeals(this.title, this.deals, this.seeAllCallback, {this.height = 168});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
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
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: height,
          child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: deals != null ? deals!.length : 0,
            itemBuilder: (_, index) => DealCard(deals![index]),
          ),
        ),
      ],
    );
  }
}
