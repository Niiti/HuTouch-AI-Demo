import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/utils/logger.dart';
import 'features/generated_ui/presentation/bloc/generated_ui_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hydrated Storage
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // Set the storage for HydratedBloc globally
  HydratedBloc.storage = storage;

  // Run the app
  runApp(MyApp());
}
