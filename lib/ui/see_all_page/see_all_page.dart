import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/deal_card.dart';
import 'package:rxdart/rxdart.dart';

class SeeAllPage extends StatefulWidget {
  static const routeName = '/see-all';

  final Stream<List<DealModel>?> stream;
  final String title;
  final Function(int) getMoreDeals;

  SeeAllPage(this.stream, this.title, this.getMoreDeals);

  @override
  State<StatefulWidget> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  final _scrollController = ScrollController();

  final _loadingController = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get _onLoadingChanged => _loadingController.stream;
  bool get _isLoading => _loadingController.value!;

  int _pageNumber = 0;

  void _scrollListener() {
    if (!_isLoading &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent) {
      _pageNumber += 1;
      _loadingController.sink.add(true);
      (widget.getMoreDeals(_pageNumber) as Future)
          .then((_) => _loadingController.sink.add(false));
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
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
              builder: (_, snapshot) {
                if (!snapshot.hasData || snapshot.data == null)
                  return const CircularProgressIndicator();
                else if (snapshot.data!.isEmpty) return const Text('No deals');
                _pageNumber = snapshot.data!.last.pageNumber;
                return StaggeredGridView.count(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  crossAxisSpacing: 10,
                  crossAxisCount: crossAxisCount,
                  children:
                      snapshot.data!.map<Widget>((e) => DealCard(e)).toList(),
                  staggeredTiles: List<StaggeredTile>.generate(
                    snapshot.data!.length,
                    (_) => StaggeredTile.fit(1),
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
