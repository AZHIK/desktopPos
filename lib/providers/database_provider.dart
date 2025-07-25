import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmavault/data/local/database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError(); // Overridden in bootstrap
});
