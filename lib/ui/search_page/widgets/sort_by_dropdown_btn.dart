import 'package:flutter/material.dart';
import 'package:maniak_game_deals/models/sort_enum.dart';
import 'package:maniak_game_deals/extensions/extensions.dart'
    show DealSortModifier, StringModifier;

class SortByDropdownButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SortByDropdownButtonState();
}

class _SortByDropdownButtonState extends State<SortByDropdownButton> {
  DealSort? _value;

  @override
  void initState() {
    super.initState();
    _value = DealSort.dealRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Sort by:'),
        const SizedBox(width: 8),
        DropdownButton<DealSort>(
          value: _value,
          items: DealSort.values
              .map<DropdownMenuItem<DealSort>>(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.string.capitalizeFirstChar()),
                ),
              )
              .toList(),
          onChanged: (value) => setState(() => _value = value),
        ),
      ],
    );
  }
}
