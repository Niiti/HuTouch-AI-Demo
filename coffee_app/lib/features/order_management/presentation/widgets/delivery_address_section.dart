import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
class DeliveryAddressSection extends StatelessWidget {
  final String address;
  final VoidCallback onEdit;
  final VoidCallback onAddNote;

  const DeliveryAddressSection({
    Key? key,
    required this.address,
    required this.onEdit,
    required this.onAddNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Sora',
            color: AppConstants.textColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          address,
          style: TextStyle(
            fontSize: 14,
            color: AppConstants.subtitleColor,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            TextButton.icon(
              onPressed: onEdit,
              icon: Icon(Icons.edit, color: AppConstants.subtitleColor),
              label: Text(
                'Edit Address',
                style: TextStyle(fontSize: 14, color: AppConstants.subtitleColor),
              ),
            ),
            TextButton.icon(
              onPressed: onAddNote,
              icon: Icon(Icons.note_add, color: AppConstants.subtitleColor),
              label: Text(
                'Add Note',
                style: TextStyle(fontSize: 14, color: AppConstants.subtitleColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
