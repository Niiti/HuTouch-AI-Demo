import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_values.dart';

class AlertItemWidget extends StatelessWidget {
  final Map<String, dynamic> alert;
  final double padding;
  final Function(bool) onToggle;

  const AlertItemWidget({
    Key? key,
    required this.alert,
    required this.padding,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: padding),
            leading: CircleAvatar(
              backgroundImage: AssetImage(alert['icon']),
              radius: 20,
            ),
            title: Text(
              alert['title'],
              style: TextStyle(
                fontSize: AppValues.fontSizeSmall,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            subtitle: alert.containsKey('description')
                ? Text(
                    alert['description'],
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.black,
                    ),
                  )
                : null,
            trailing: Switch(
              value: alert['status'].value,
              activeColor: AppColors.switchActive,
              onChanged: onToggle,
            ),
          ),
          Divider(height: 1),
        ],
      ),
    );
  }
}
