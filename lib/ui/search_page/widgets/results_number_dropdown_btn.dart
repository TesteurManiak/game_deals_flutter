import 'package:flutter/material.dart';

class ResultsNumberDropdownButton extends StatefulWidget {
  final ValueNotifier<int> controller;

  const ResultsNumberDropdownButton(this.controller);

  @override
  State<StatefulWidget> createState() => _ResultsNumberDropdownButtonState();
}

class _ResultsNumberDropdownButtonState
    extends State<ResultsNumberDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Number of results:'),
        const SizedBox(width: 8),
        DropdownButton<int>(
          value: widget.controller.value,
          items: List<DropdownMenuItem<int>>.generate(
            6,
            (index) {
              final value = (index + 1) * 10;
              return DropdownMenuItem(
                value: value,
                child: Text(value.toString()),
              );
            },
          ),
          onChanged: (value) =>
              setState(() => widget.controller.value = value!),
        ),
      ],
    );
  }
}
