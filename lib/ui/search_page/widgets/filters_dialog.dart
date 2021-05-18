import 'package:flutter/material.dart';
import 'package:maniak_game_deals/bloc/bloc_provider.dart';
import 'package:maniak_game_deals/bloc/filters_bloc.dart';
import 'package:maniak_game_deals/models/filters_actions_enum.dart';
import 'package:maniak_game_deals/models/filters_model.dart';
import 'package:maniak_game_deals/models/filters_response.dart';
import 'package:maniak_game_deals/models/sort_enum.dart';
import 'package:maniak_game_deals/models/store_model.dart';
import 'package:maniak_game_deals/ui/search_page/widgets/descendant.dart';
import 'package:maniak_game_deals/ui/search_page/widgets/results_number_dropdown_btn.dart';
import 'package:maniak_game_deals/ui/search_page/widgets/sort_by_dropdown_btn.dart';
import 'package:maniak_game_deals/ui/search_page/widgets/stores_dropdown_btn.dart';

class FiltersDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FiltersDialogState();
}

class _FiltersDialogState extends State<FiltersDialog> {
  late final _filtersBloc = BlocProvider.of<FiltersBloc>(context);

  final _formKey = GlobalKey<FormState>();

  late final ValueNotifier<StoreModel?> _stores;
  late final ValueNotifier<bool> _desc;
  late final ValueNotifier<DealSort> _sortBy;
  late final ValueNotifier<int> _results;

  void _filters() {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      Navigator.pop<FiltersResponse>(
        context,
        FiltersResponse(
          filtersActions: FiltersActions.filters,
          filtersModel: FiltersModel(
            store: _stores.value,
            desc: _desc.value,
            sortBy: _sortBy.value,
            results: _results.value,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _stores = ValueNotifier<StoreModel?>(_filtersBloc.filters?.store);
    _desc = ValueNotifier<bool>(_filtersBloc.filters?.desc ?? false);
    _sortBy = ValueNotifier<DealSort>(
        _filtersBloc.filters?.sortBy ?? DealSort.dealRating);
    _results = ValueNotifier<int>(_filtersBloc.filters?.results ?? 60);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filters'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StoresDropDownButton(_stores),
              ResultsNumberDropdownButton(_results),
              SortByDropdownButton(_sortBy),
              Descendant(),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () => Navigator.pop<FiltersResponse>(
            context,
            FiltersResponse(filtersActions: FiltersActions.reset),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop<FiltersResponse>(
            context,
            FiltersResponse(filtersActions: FiltersActions.cancel),
          ),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _filters,
          child: const Text('Filter'),
        ),
      ],
    );
  }
}
