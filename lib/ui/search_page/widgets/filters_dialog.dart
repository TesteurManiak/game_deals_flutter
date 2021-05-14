import 'package:flutter/material.dart';
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
              StoresDropDownButton(),
              ResultsNumberDropdownButton(),
              SortByDropdownButton(),
              Descendant(),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final formState = _formKey.currentState;
            if (formState != null && formState.validate()) {
              Navigator.pop(context, true);
            }
          },
          child: const Text('Filter'),
        ),
      ],
    );
  }
}
