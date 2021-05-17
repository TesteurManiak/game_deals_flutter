import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/models/deal_display_model.dart';
import 'package:maniak_game_deals/models/deal_look_up_model.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/ui/deal_page/widgets/buy_btn.dart';
import 'package:maniak_game_deals/ui/deal_page/widgets/game_header.dart';

class DealPage extends StatefulWidget {
  static const routeName = '/deal';

  final DealDisplayModel displayModel;

  const DealPage(this.displayModel);

  @override
  State<StatefulWidget> createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  late final Future<DealLookUpModel> _future;
  late final _dealsBloc = BlocProvider.of<DealsBloc>(context);

  @override
  void initState() {
    super.initState();
    _future = _dealsBloc.lookUpDeal(widget.displayModel.dealID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: MyColors.appBarActions,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GameHeader(
            widget.displayModel.thumb,
            widget.displayModel.uid,
            widget.displayModel.storeID,
            widget.displayModel.title,
            widget.displayModel.dealRating,
          ),
          const SizedBox(height: 32),
          FutureBuilder<DealLookUpModel>(
            future: _future,
            builder: (_, snapshot) {
              if (!snapshot.hasData) return BuyBtn.disabled();
              return BuyBtn(
                salePrice: snapshot.data!.gameInfo.salePrice,
                storeID: snapshot.data!.gameInfo.storeID,
                steamAppID: snapshot.data!.gameInfo.steamAppID,
                dealID: widget.displayModel.dealID,
              );
            },
          ),
        ],
      ),
    );
  }
}
