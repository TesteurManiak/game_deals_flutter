import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/stores_bloc.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/style/text_styles.dart';
import 'package:maniak_game_deals/ui/common/deal_icon.dart';

class GameHeader extends StatelessWidget {
  final DealModel deal;

  GameHeader(this.deal);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: DealIcon(deal),
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
              Text(deal.title, style: TextStyles.dealTitle),
              const SizedBox(height: 4),
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
              const SizedBox(height: 4),
              if (deal.dealRating != null)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: deal.dealRating!.toStringAsFixed(1),
                        style: TextStyles.dealRating,
                      ),
                      TextSpan(text: '/10', style: TextStyles.dealRating2),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
