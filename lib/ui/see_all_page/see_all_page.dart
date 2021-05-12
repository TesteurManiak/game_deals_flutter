import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/deal_card.dart';

class SeeAllPage extends StatefulWidget {
  static const routeName = '/see-all';

  final Stream<List<DealModel>?> stream;
  final String title;

  SeeAllPage(this.stream, this.title);

  @override
  State<StatefulWidget> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final crossAxisCount = (size.width / 100).floor();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<DealModel>?>(
        stream: widget.stream,
        builder: (_, snapshot) {
          if (!snapshot.hasData || snapshot.data == null)
            return const CircularProgressIndicator();
          else if (snapshot.data!.isEmpty) return const Text('No deals');
          return StaggeredGridView.count(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            crossAxisSpacing: 10,
            crossAxisCount: crossAxisCount,
            children: snapshot.data!.map<Widget>((e) => DealCard(e)).toList(),
            staggeredTiles: List<StaggeredTile>.generate(
              snapshot.data!.length,
              (_) => StaggeredTile.fit(1),
            ),
          );
        },
      ),
    );
  }
}
