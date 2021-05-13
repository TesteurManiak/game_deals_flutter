import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/other_deals.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/recent_deals_list.dart';
import 'package:maniak_game_deals/ui/see_all_page/see_all_page.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _dealsBloc = BlocProvider.of<DealsBloc>(context);
    final size = MediaQuery.of(context).size;
    final length = (size.width / 100).floor() + 1;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
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
              _dealsBloc.firstRecent(length),
              () => Navigator.pushNamed(
                context,
                SeeAllPage.routeName,
                arguments: [
                  _dealsBloc.onRecentDealsChanged,
                  'Newest deals',
                  (int pageNum) => _dealsBloc.fetchRecentDeals(pageNum),
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
              _dealsBloc.firstCheapest(length),
              () => Navigator.pushNamed(
                context,
                SeeAllPage.routeName,
                arguments: [
                  _dealsBloc.onCheapestDealsChanged,
                  'Cheapest deals',
                  (int pageNum) => _dealsBloc.fetchCheapestDeals(pageNum),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
