import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://kfiszpmrpbblmfiqmbtk.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtmaXN6cG1ycGJibG1maXFtYnRrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDgwMzMxMDYsImV4cCI6MjAyMzYwOTEwNn0.M6DAkmxy7xPaV6FF5jCg3-v5nE9vXRiBUECqgQ5fvHU';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
