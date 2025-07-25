// lib/data/app_database.dart

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:pharmavault/data/local/daos/product_dao.dart';
import 'package:pharmavault/data/local/daos/users_dao.dart';
import 'package:pharmavault/data/local/tables/credits.dart';
import 'package:pharmavault/data/local/tables/customers.dart';
import 'package:pharmavault/data/local/tables/orders.dart';
import 'package:pharmavault/data/local/tables/products.dart';
import 'package:pharmavault/data/local/tables/stores.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite3;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'tables/users.dart';
// import 'tables/customers.dart';
// import 'tables/products.dart';
// import 'tables/orders.dart';
// import 'tables/employees.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Products,
    Stores,
    StoreSettings,
    Customers,
    Orders,
    OrderItems,
    CreditPlans,
    InstallmentPayments,
    OrderPayments,
    OrderDiscounts,
    OrderLogs,
  ],
  daos: [
    UsersDao,
    ProductDao,
  ]
)
class AppDatabase extends _$AppDatabase {
  /// Allows injection of a custom [QueryExecutor] for testing or multi-platform support.
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  /// Drift schema version.
  @override
  // ignore: override_on_non_overriding_member
  int get schemaVersion => 1;

  // Find user by username
  @override
  late final UsersDao usersDao = UsersDao(this);
  @override
  late final ProductDao productDao = ProductDao(this);
}

/// Lazily opens the database connection in the documents directory.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pos_app.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
