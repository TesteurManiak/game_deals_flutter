import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/stores_bloc.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/style/text_styles.dart';
import 'package:maniak_game_deals/ui/deal_page/deal_page.dart';

class DealItem extends StatelessWidget {
  final DealModel deal;
  final double height;

  DealItem(this.deal, this.height);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width * 0.6;
    return Hero(
      tag: deal.uid,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => Navigator.pushNamed(
            context,
            DealPage.routeName,
            arguments: deal,
          ),
          child: Container(
            width: width,
            height: height,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: deal.thumb,
                    placeholder: (_, __) =>
                        Center(child: const CircularProgressIndicator()),
                    height: height,
                    width: width,
                    errorWidget: (_, url, e) {
                      return Container(
                        height: height,
                        width: width,
                        color: Colors.black.withOpacity(0.3),
                        child: Icon(Icons.error, color: Colors.white),
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  width: size.width * 0.6,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(8),
                      ),
                    ),
                    child: Text(deal.title, style: TextStyles.dealOverlay),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: MyColors.progressIndicator,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(10)),
                    ),
                    child: Text(
                      '-${deal.percentageOff}',
                      style: TextStyles.dealOverlay,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Image.asset(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
