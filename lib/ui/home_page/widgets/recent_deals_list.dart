import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/deal_item.dart';

class RecentDealsList extends StatefulWidget {
  final double height;
  final double width;

  RecentDealsList({this.height = 212.0, this.width = double.maxFinite});

  @override
  State<StatefulWidget> createState() => _RecentDealsListState();
}

class _RecentDealsListState extends State<RecentDealsList> {
  late final DealsBloc _dealsBloc;

  @override
  void initState() {
    super.initState();
    _dealsBloc = BlocProvider.of<DealsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: StreamBuilder<List<DealModel>?>(
        stream: _dealsBloc.onBestDealsChanged,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null)
            return const CircularProgressIndicator();
          if (snapshot.data!.isEmpty) return const Text('No deals');
          return CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              height: widget.height,
              viewportFraction: 0.7,
            ),
            items: snapshot.data!
                .map<Widget>((e) => DealItem(e, widget.height))
                .toList(),
          );
        },
      ),
    );
  }
}
