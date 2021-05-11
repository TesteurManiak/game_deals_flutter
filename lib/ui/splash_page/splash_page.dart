import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/deals_bloc.dart';
import 'package:maniak_game_deals/bloc/stores_bloc.dart';
import 'package:maniak_game_deals/style/my_colors.dart';
import 'package:maniak_game_deals/ui/home_page/home_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final DealsBloc _dealsBloc;
  late final StoresBloc _storesBloc;

  Future<void> _loadAllData() async {
    await Future.wait([
      _dealsBloc.fetchBestDeals(),
      _dealsBloc.fetchRecentDeals(),
      _dealsBloc.fetchCheapestDeals(),
      _storesBloc.fetchStores(),
    ]);
  }

  @override
  void initState() {
    super.initState();
    _dealsBloc = BlocProvider.of<DealsBloc>(context);
    _storesBloc = BlocProvider.of<StoresBloc>(context);

    _loadAllData().then(
        (_) => Navigator.pushReplacementNamed(context, HomePage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: MyColors.progressIndicator),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Icon(
                            Icons.gamepad,
                            size: 50,
                            color: MyColors.progressIndicator,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Game Store',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
