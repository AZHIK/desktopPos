import 'package:drift/drift.dart';

class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerId =>
      integer().customConstraint('REFERENCES customers(id)')();
  DateTimeColumn get orderDate =>
      dateTime().withDefault(currentDateAndTime)();
  RealColumn get totalAmount => real()();
  TextColumn get orderStatus => text().withLength(min: 1, max: 50).withDefault(Constant('PENDING'))();
  TextColumn get paymentMethod => text().nullable()();
  TextColumn get paymentStatus => text().withDefault(Constant('NOT_PAID'))();
  TextColumn get orderType => text().nullable()();
  BoolColumn get deliveryRequired => boolean().withDefault(Constant(false))();
  IntColumn get storeId => integer().customConstraint('REFERENCES stores(id)')();
  TextColumn get phoneNumber => text().withLength(min: 1, max: 20)();
  IntColumn get createdBy => integer().nullable().customConstraint('REFERENCES users(id)')();
}


class OrderItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId =>
      integer().customConstraint('REFERENCES orders(id)')();
  IntColumn get productId =>
      integer().customConstraint('REFERENCES products(id)')();
  IntColumn get quantity => integer()();
  RealColumn get price => real()();
  RealColumn get buyingPrice => real()();
  RealColumn get taxAmount => real()();
  IntColumn get storeId => integer().customConstraint('REFERENCES stores(id)')();
  TextColumn get saleType => text().withDefault(Constant('RETAIL'))();
}


class OrderPayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId =>
      integer().customConstraint('REFERENCES orders(id)')();
  RealColumn get amount => real()();
  TextColumn get method => text()();
  DateTimeColumn get paidAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get reference => text().nullable()();
  IntColumn get receivedBy =>
      integer().nullable().customConstraint('REFERENCES users(id)')();
}

class OrderDiscounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId =>
      integer().customConstraint('REFERENCES orders(id)')();
  TextColumn get discountType => text()();
  RealColumn get value => real()();
  TextColumn get reason => text().nullable()();
}


class OrderLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId =>
      integer().customConstraint('REFERENCES orders(id)')();
  TextColumn get status => text()();
  TextColumn get comment => text().nullable()();
  IntColumn get changedBy =>
      integer().nullable().customConstraint('REFERENCES users(id)')();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}