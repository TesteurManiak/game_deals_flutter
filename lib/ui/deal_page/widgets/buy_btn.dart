import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/stores_bloc.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/style/my_gradients.dart';
import 'package:maniak_game_deals/style/text_styles.dart';
import 'package:maniak_game_deals/ui/common/elevated_gradient_button.dart';
import 'package:maniak_game_deals/utils/consts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maniak_game_deals/extensions/extensions.dart'
    show IterableModifier;

class BuyBtn extends StatelessWidget {
  final double salePrice;
  final String storeID;
  final String title;
  final String? steamAppID;
  final bool enabled;

  BuyBtn({
    required this.salePrice,
    required this.storeID,
    required this.title,
    required this.steamAppID,
    this.enabled = true,
  });

  factory BuyBtn.disabled() => BuyBtn(
        salePrice: 0,
        storeID: '',
        title: '',
        steamAppID: null,
        enabled: false,
      );

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
              enabled
                  ? Text(
                      '\$${salePrice.toStringAsFixed(2)}',
                      style: TextStyles.dealPagePrice,
                    )
                  : Container(),
              const SizedBox(width: 28),
              ElevatedGradientButton(
                child: const Text('Buy it Online', style: TextStyles.buyBtn),
                gradient: MyGradients.buyBtn,
                onPressed: enabled
                    ? () async {
                        final store = BlocProvider.of<StoresBloc>(context)
                            .stores
                            ?.firstWhereNullable((e) => e.storeID == storeID);
                        if (store != null) {
                          final url = Endpoints.storeUrl(
                            store.storeEnum,
                            title,
                            steamAppID,
                          );
                          print(url);
                          if (url != null && await canLaunch(url)) {
                            await launch(url);
                          }
                        }
                      }
                    : null,
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
