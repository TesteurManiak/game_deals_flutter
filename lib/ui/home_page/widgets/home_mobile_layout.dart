import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/other_deals.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/recent_deals_list.dart';
import 'package:maniak_game_deals/ui/see_all_page/see_all_page.dart';

class HomeMobileLayout extends StatelessWidget {
  final List<BottomNavigationBarItem> items;

  HomeMobileLayout(this.items);

  @override
  Widget build(BuildContext context) {
    final _dealsBloc = BlocProvider.of<DealsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Store'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(items: items),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: <Widget>[
            RecentDealsList(),
            const SizedBox(height: 24),
            StreamBuilder<List<DealModel>?>(
              stream: _dealsBloc.onRecentDealsChanged,
              builder: (_, snapshot) {
                if (!snapshot.hasData || snapshot.data == null)
                  return const CircularProgressIndicator();
                if (snapshot.data!.isEmpty) return const Text('No deals');
                return OtherDeals(
                  'Newest deals',
                  _dealsBloc.firstRecent(10),
                  () => Navigator.pushNamed(
                    context,
                    SeeAllPage.routeName,
                    arguments: [
                      _dealsBloc.onRecentDealsChanged,
                      'Newest deals'
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            StreamBuilder<List<DealModel>?>(
              stream: _dealsBloc.onCheapestDealsChanged,
              builder: (_, snapshot) {
                if (!snapshot.hasData || snapshot.data == null)
                  return const CircularProgressIndicator();
                if (snapshot.data!.isEmpty) return const Text('No deals');
                return OtherDeals(
                  'Cheapest deals',
                  _dealsBloc.firstCheapest(10),
                  () => Navigator.pushNamed(
                    context,
                    SeeAllPage.routeName,
                    arguments: [
                      _dealsBloc.onCheapestDealsChanged,
                      'Cheapest deals'
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
