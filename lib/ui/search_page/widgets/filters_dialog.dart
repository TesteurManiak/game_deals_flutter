import 'package:flutter/material.dart';

class FiltersDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FiltersDialogState();
}

class _FiltersDialogState extends State<FiltersDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filters'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Filter')),
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
