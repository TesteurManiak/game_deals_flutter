import 'package:flutter/material.dart';

class Descendant extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DescendantState();
}

class _DescendantState extends State<Descendant> {
  bool? _value;

  @override
  void initState() {
    super.initState();
    _value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Descending results:'),
        const SizedBox(width: 8),
        Checkbox(
          value: _value,
          onChanged: (value) => setState(() => _value = value),
        ),
      ],
    );
  }
}
