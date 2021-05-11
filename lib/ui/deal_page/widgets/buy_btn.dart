import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/style/my_gradients.dart';
import 'package:maniak_game_deals/style/text_styles.dart';
import 'package:maniak_game_deals/ui/common/elevated_gradient_button.dart';

class BuyBtn extends StatelessWidget {
  final DealModel deal;

  BuyBtn(this.deal);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container()),
        Container(
          decoration: BoxDecoration(
            color: MyColors.priceContainer,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 28),
              Text(
                '\$${deal.salePrice.toStringAsFixed(2)}',
                style: TextStyles.dealPagePrice,
              ),
              const SizedBox(width: 28),
              ElevatedGradientButton(
                child: const Text('Buy it Online', style: TextStyles.buyBtn),
                gradient: MyGradients.buyBtn,
                onPressed: () {},
                borderRadius: BorderRadius.circular(100),
                shadowColor: MyColors.buyBtnShadow.withOpacity(0.3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
