import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/stores_bloc.dart';
import 'package:maniak_game_deals/models/store_model.dart';

class StoresDropDownBtn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StoresDropDownBtnState();
}

class _StoresDropDownBtnState extends State<StoresDropDownBtn> {
  late final _storesBloc = BlocProvider.of<StoresBloc>(context);
  late StoreModel? _value;

  @override
  void initState() {
    super.initState();
    _value = _storesBloc.stores?.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<StoreModel>(
      value: _value,
      items: _storesBloc.stores!
          .map<DropdownMenuItem<StoreModel>>(
            (e) => DropdownMenuItem(
              child: Text(e.storeName),
              value: e,
            ),
          )
          .toList(),
      onChanged: (value) => setState(() => _value = value),
    );
  }
}
