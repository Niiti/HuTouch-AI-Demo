
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DbSupaBase {
  static DbSupaBase? _instance;

  DbSupaBase._internal();

  factory DbSupaBase() {
    _instance ??= DbSupaBase._internal();
    return _instance!;
  }

  static DbSupaBase? _database;

  Future<DbSupaBase?> get database async {
    if (_database != null) return _database;
    _database = await init();
    return _database;
  }

  init() async {
    await dotenv.load(fileName: ".env");
    String supaBaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
    String supaBaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

    await Supabase.initialize(url: supaBaseUrl, anonKey: supaBaseAnonKey);
  }
}
