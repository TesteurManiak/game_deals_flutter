import 'package:flutter/material.dart';
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
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) =>
                Center(child: DealCard(snapshot.data![index])),
          );
        },
      ),
    );
  }
}
