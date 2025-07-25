import 'package:drift/drift.dart';

enum  CustomerType { WALK_IN, REGISTERED, WHOLESALE }

class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 120)();
  TextColumn get phone => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get email => text().nullable()();
  IntColumn get storeId => integer().customConstraint('REFERENCES stores(id)')();
  TextColumn get customerType => text().withDefault(Constant('WALK_IN'))();
}
