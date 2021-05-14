import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/stores_bloc.dart';
import 'package:maniak_game_deals/models/deal_display_model.dart';
import 'package:maniak_game_deals/models/game_look_up_model.dart';
import 'package:maniak_game_deals/extensions/extensions.dart'
    show IterableModifier;
import 'package:maniak_game_deals/ui/deal_page/deal_page.dart';

class AvailableDealTile extends StatelessWidget {
  final AvailableDeal availableDeal;
  final String thumb;
  final String title;

  AvailableDealTile({
    required this.availableDeal,
    required this.thumb,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final storeObj = BlocProvider.of<StoresBloc>(context)
        .stores!
        .firstWhereNullable((e) => e.storeID == availableDeal.storeID);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(
          storeObj!.images!.iconUrl!,
          errorBuilder: (_, __, ___) => const Icon(Icons.error),
        ),
        title: Text('\$${availableDeal.price.toStringAsFixed(2)}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.pushNamed(
          context,
          DealPage.routeName,
          arguments: DealDisplayModel.fromAvailableDeal(
            availableDeal,
            thumb,
            title,
          ),
        ),
      ),
    );
  }
}