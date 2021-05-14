import 'package:flutter/material.dart';

class ResultsNumberDropdownButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResultsNumberDropdownButtonState();
}

class _ResultsNumberDropdownButtonState
    extends State<ResultsNumberDropdownButton> {
  int? _value;

  @override
  void initState() {
    super.initState();
    _value = 60;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Number of results:'),
        const SizedBox(width: 8),
        DropdownButton<int>(
          value: _value,
          items: List<DropdownMenuItem<int>>.generate(
            6,
            (index) {
              final value = (index + 1) * 10;
              return DropdownMenuItem(
                child: Text(value.toString()),
                value: value,
              );
            },
          ),
          onChanged: (value) => setState(() => _value = value),
        ),
      ],
    );
  }
}
