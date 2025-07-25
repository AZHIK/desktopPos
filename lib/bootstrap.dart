import 'package:pharmavault/app.dart';
import 'package:pharmavault/core/utils/database_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pharmavault/data/local/database.dart';
import 'package:pharmavault/providers/database_provider.dart';
import 'package:pharmavault/data/local/daos/users_dao.dart';
import 'package:pharmavault/providers/users_dao_provider.dart';

Future<void> bootstrap() async {
  final db = AppDatabase();

  // Force database file creation (dev only)
  await ensureDatabaseCreated(db, debug: true);

  // You can pass the DB to the ProviderScope overrides in main.dart
  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(db),
        usersDaoProvider.overrideWithValue(UsersDao(db)),
      ],
      child: const MyApp(),
    ),
  );
}
