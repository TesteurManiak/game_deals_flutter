import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/stores_bloc.dart';
import 'package:maniak_game_deals/models/deal_display_model.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/text_styles.dart';
import 'package:maniak_game_deals/ui/common/deal_icon.dart';
import 'package:maniak_game_deals/ui/deal_page/deal_page.dart';

class DealCard extends StatelessWidget {
  final DealModel deal;
  final double width;

  const DealCard(this.deal, {this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Navigator.pushNamed(
          context,
          DealPage.routeName,
          arguments: DealDisplayModel.fromDealModel(deal),
        ),
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DealIcon(deal.thumb, width: width, uid: deal.uid),
              const SizedBox(height: 10),
              Text(
                deal.title,
                style: TextStyles.dealCard,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              Image.asset(
                BlocProvider.of<StoresBloc>(context)
                    .stores!
                    .firstWhere((e) => e.storeID == deal.storeID)
                    .images!
                    .iconUrl!,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(height: 8),
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
      ),
    );
  }
}
