// lib/data/tables/users.dart
import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 3, max: 32)();
  TextColumn get password => text()(); // hash in real apps
  TextColumn get role => text().withDefault(Constant('cashier'))();
}
