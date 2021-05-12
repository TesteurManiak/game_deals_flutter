import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/ui/common/app_logo.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/other_deals.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/recent_deals_list.dart';
import 'package:maniak_game_deals/ui/see_all_page/see_all_page.dart';

class HomeWebLayout extends StatelessWidget {
  final List<BottomNavigationBarItem> items;

  HomeWebLayout(this.items);

  @override
  Widget build(BuildContext context) {
    final _dealsBloc = BlocProvider.of<DealsBloc>(context);
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            elevation: 4,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: MyColors.appLogo),
                  child: const AppLogo(avatarSize: 40),
                ),
                ...items
                    .map<Widget>(
                      (e) => ListTile(
                        leading: e.icon,
                        title: Text(e.label!),
                        onTap: () {},
                      ),
                    )
                    .toList()
              ],
            ),
          ),
          Expanded(
            child: ListView(
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
                      _dealsBloc.firstRecent(20),
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
                      _dealsBloc.firstCheapest(20),
                      () => Navigator.pushNamed(
                        context,
                        SeeAllPage.routeName,
                        arguments: [
                          _dealsBloc.onCheapestDealsChanged,
                          'Cheapest deals',
                          (int pageNum) =>
                              _dealsBloc.fetchCheapestDeals(pageNum),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
