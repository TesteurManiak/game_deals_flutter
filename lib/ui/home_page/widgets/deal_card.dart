import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/text_styles.dart';
import 'package:maniak_game_deals/ui/deal_page/deal_page.dart';

class DealCard extends StatelessWidget {
  final DealModel deal;
  final double width;

  DealCard(this.deal, {this.width = 100});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () =>
          Navigator.pushNamed(context, DealPage.routeName, arguments: deal),
      child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: deal.thumb,
                height: 100,
                width: width,
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    Center(child: const CircularProgressIndicator()),
                errorWidget: (_, __, ___) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Icon(Icons.error, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              deal.title,
              style: TextStyles.dealCard,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '\$${deal.salePrice.toStringAsFixed(2)}',
                  style: TextStyles.salePrice,
                ),
                if (deal.isOnSale) const SizedBox(width: 10),
                if (deal.isOnSale)
                  Text(
                    '\$${deal.normalPrice.toStringAsFixed(2)}',
                    style: TextStyles.normalPrice,
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
