import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  RealColumn get retailPrice => real()();
  RealColumn get wholesalePrice => real()();
  RealColumn get retailPriceWithTax => real().nullable()();
  RealColumn get wholesalePriceWithTax => real().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
