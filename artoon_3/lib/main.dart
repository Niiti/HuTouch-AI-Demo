import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'view_models/language_selection_view_model.dart';
import 'view_models/feature_viewmodel.dart';
import 'view_models/upload_photo_view_model.dart';
import 'view_models/gender_selection_viewmodel.dart';
import 'view_models/ai_art_home_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageSelectionViewModel()),
        ChangeNotifierProvider(create: (context) => FeatureViewModel()),
        ChangeNotifierProvider(create: (context) => UploadPhotoViewModel()),
        ChangeNotifierProvider(create: (context) => GenderSelectionViewModel()),
        ChangeNotifierProvider(create: (context) => AiArtHomeViewModel()),
      ],
      child: MyApp(),
    ),
  );
}
