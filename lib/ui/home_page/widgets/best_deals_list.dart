import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/deal_item.dart';

class BestDealsList extends StatefulWidget {
  final double height;
  final double width;

  const BestDealsList({this.height = 212.0, this.width = double.maxFinite});

  @override
  State<StatefulWidget> createState() => _BestDealsListState();
}

class _BestDealsListState extends State<BestDealsList> {
  final _controller = CarouselController();

  late final DealsBloc _dealsBloc = BlocProvider.of<DealsBloc>(context);

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      if (event.scrollDelta.dy > 0) {
        _controller.nextPage();
      } else {
        _controller.previousPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: StreamBuilder<List<DealModel>?>(
        stream: _dealsBloc.onBestDealsChanged,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const CircularProgressIndicator();
          }
          if (snapshot.data!.isEmpty) return const Text('No deals');
          return Listener(
            onPointerSignal: _onPointerSignal,
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                height: widget.height,
                viewportFraction: 0.7,
              ),
              items: snapshot.data!
                  .map<Widget>((e) => DealItem(e, widget.height))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
