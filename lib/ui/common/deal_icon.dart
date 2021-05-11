import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/deal_model.dart';

class DealIcon extends StatelessWidget {
  final double height;
  final double width;
  final DealModel deal;

  DealIcon(this.deal, {this.height = 100, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: deal.uid,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: deal.thumb,
          height: height,
          width: width,
          fit: BoxFit.cover,
          placeholder: (_, __) =>
              Center(child: const CircularProgressIndicator()),
          errorWidget: (_, __, ___) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.3),
            ),
            child: const Icon(Icons.error, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
