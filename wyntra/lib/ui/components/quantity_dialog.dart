import 'package:flutter/material.dart';

class QuantityDialog extends StatefulWidget {
  final int currentQuantity;

  QuantityDialog({required this.currentQuantity});

  @override
  _QuantityDialogState createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<QuantityDialog> {
  late int selectedQuantity;

  @override
  void initState() {
    super.initState();
    selectedQuantity = widget.currentQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Quantity'),
      content: DropdownButton<int>(
        value: selectedQuantity,
        onChanged: (int? newValue) {
          setState(() {
            selectedQuantity = newValue!;
          });
        },
        items: List.generate(10, (index) => index + 1).map((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text('$value'),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(selectedQuantity);
          },
        ),
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
