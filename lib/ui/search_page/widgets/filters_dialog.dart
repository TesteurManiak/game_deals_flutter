import 'package:flutter/material.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _stores = ValueNotifier<StoreModel?>(null);

  void _filters() {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      Navigator.pop<FiltersResponse>(
        context,
        FiltersResponse(
          filtersActions: FiltersActions.filters,
          filtersModel: FiltersModel(
            store: _stores.value,
            desc: false,
            sortBy: DealSort.dealRating,
            results: 60,
          ),
        ),
      );
    }
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
              ResultsNumberDropdownButton(),
              SortByDropdownButton(),
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
