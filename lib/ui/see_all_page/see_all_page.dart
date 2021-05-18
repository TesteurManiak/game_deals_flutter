import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/ui/common/responsive.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/deal_card.dart';
import 'package:rxdart/rxdart.dart';

class SeeAllPage extends StatefulWidget {
  static const routeName = '/see-all';

  final Stream<List<DealModel>?> stream;
  final String title;
  final Function(int) getMoreDeals;
  final int scrollOffset;
  final Axis scrollDirection;

  const SeeAllPage(
    this.stream,
    this.title,
    this.getMoreDeals, {
    this.scrollOffset = 100,
    this.scrollDirection = Axis.vertical,
  });

  @override
  State<StatefulWidget> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  late final _scrollController = ScrollController()
    ..addListener(_scrollListener);

  final _loadingController = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get _onLoadingChanged => _loadingController.stream;
  bool get _isLoading => _loadingController.value!;

  int _pageNumber = 0;

  void _loadMore() {
    if (_isLoading) return;
    _pageNumber += 1;
    _loadingController.sink.add(true);
    (widget.getMoreDeals(_pageNumber) as Future)
        .then((_) => _loadingController.sink.add(false));
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (widget.scrollDirection == notification.metrics.axis) {
      if (notification is ScrollUpdateNotification) {
        if (notification.metrics.maxScrollExtent >
                notification.metrics.pixels &&
            notification.metrics.maxScrollExtent -
                    notification.metrics.pixels <=
                widget.scrollOffset) {
          _loadMore();
        }
        return true;
      }

      if (notification is OverscrollNotification) {
        if (notification.overscroll > 0) {
          _loadMore();
        }
        return true;
      }
    }
    return false;
  }

  @override
  void dispose() {
    _loadingController.close();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final crossAxisCount = (size.width / 100).floor();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<DealModel>?>(
              stream: widget.stream,
              builder: (streamContext, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return const CircularProgressIndicator();
                } else if (snapshot.data!.isEmpty) {
                  return const Text('No deals');
                }
                _pageNumber = snapshot.data!.last.pageNumber;
                return NotificationListener<ScrollNotification>(
                  onNotification: _handleScrollNotification,
                  child: StaggeredGridView.countBuilder(
                    scrollDirection: widget.scrollDirection,
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: Responsive.isMobile(streamContext) ? 10 : 24,
                    ),
                    crossAxisSpacing: 10,
                    crossAxisCount: crossAxisCount,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, int index) =>
                        DealCard(snapshot.data![index]),
                    staggeredTileBuilder: (_) =>
                        const StaggeredTile.count(1, 2.2),
                  ),
                );
              },
            ),
          ),
          StreamBuilder<bool>(
            initialData: _isLoading,
            stream: _onLoadingChanged,
            builder: (_, snapshot) => snapshot.data!
                ? const CircularProgressIndicator()
                : Container(),
          ),
        ],
      ),
    );
  }
}
