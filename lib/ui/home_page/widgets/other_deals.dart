import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/style/text_styles.dart';
import 'package:maniak_game_deals/ui/common/responsive.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/deal_card.dart';

class OtherDeals extends StatefulWidget {
  final double height;
  final List<DealModel>? deals;
  final String title;
  final VoidCallback seeAllCallback;

  const OtherDeals(
    this.title,
    this.deals,
    this.seeAllCallback, {
    this.height = 188,
  });

  @override
  State<StatefulWidget> createState() => _OtherDealsState();
}

class _OtherDealsState extends State<OtherDeals> {
  final _controller = ScrollController();

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      final offset = _controller.offset + event.scrollDelta.dy;
      _controller.animateTo(
        offset,
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double hPadding = Responsive.isMobile(context) ? 10 : 24;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: hPadding),
          child: Row(
            children: [
              Container(
                height: 20,
                width: 3,
                decoration: BoxDecoration(
                  color: MyColors.tabBarIndicator,
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              const SizedBox(width: 8),
              Text(widget.title, style: TextStyles.categoryTitle),
              Expanded(child: Container()),
              TextButton(
                onPressed: widget.seeAllCallback,
                child: const Text('See all'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: widget.height,
          child: Listener(
            onPointerSignal: _onPointerSignal,
            child: ListView.separated(
              controller: _controller,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              scrollDirection: Axis.horizontal,
              itemCount: widget.deals != null ? widget.deals!.length : 0,
              itemBuilder: (_, index) => DealCard(widget.deals![index]),
            ),
          ),
        ),
      ],
    );
  }
}
