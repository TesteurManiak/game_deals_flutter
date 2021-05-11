import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/models/deal_model.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/other_deals.dart';
import 'package:maniak_game_deals/ui/home_page/widgets/recent_deals_list.dart';
import 'package:maniak_game_deals/ui/see_all_page/see_all_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabs = <String>['Games', 'Preorders', 'In-game items'];
  final _bottom = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Whishlist'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  late final DealsBloc _dealsBloc;

  @override
  void initState() {
    super.initState();
    _dealsBloc = BlocProvider.of<DealsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Game Store'),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            isScrollable: true,
            tabs: _tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: _bottom),
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
                    _dealsBloc.top10RecentDeals,
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
                    _dealsBloc.top10CheapestDeals,
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
      ),
    );
  }
}
