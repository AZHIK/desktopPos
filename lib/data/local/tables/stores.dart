import 'package:drift/drift.dart';

class Stores extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
}

class StoreSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get storeId => integer().customConstraint('REFERENCES stores(id)')();
  TextColumn get key => text()();
  TextColumn get value => text()();
}