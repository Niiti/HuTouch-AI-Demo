import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';
import 'package:my_project/core/localization/app_localizations.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Text(
        localizations.translate("cartTitle"),
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.03,
          fontFamily: 'Gilroy-Bold',
          color: ColorPalette.textPrimary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}