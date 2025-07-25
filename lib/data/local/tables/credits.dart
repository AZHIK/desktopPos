import 'package:drift/drift.dart';

class CreditPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId =>
      integer().customConstraint('REFERENCES orders(id)')();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
  IntColumn get numberOfInstallments => integer().withDefault(Constant(1))();
  RealColumn get installmentAmount => real()();
  RealColumn get finalAmount => real()();
  RealColumn get totalPaid => real().withDefault(Constant(0))();
  IntColumn get gracePeriodDays => integer().withDefault(Constant(0))();
  DateTimeColumn get nextDueDate => dateTime().nullable()();
  TextColumn get status => text().withDefault(Constant('ACTIVE'))();
  TextColumn get notes => text().nullable()();
}

class InstallmentPayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get planId =>
      integer().customConstraint('REFERENCES credit_plans(id)')();
  DateTimeColumn get dueDate => dateTime()();
  RealColumn get amountDue => real()();
  RealColumn get amountPaid => real().withDefault(Constant(0))();
  DateTimeColumn get paidDate => dateTime().nullable()();
  TextColumn get status => text().withDefault(Constant('ACTIVE'))();
  BoolColumn get reminderSent => boolean().withDefault(Constant(false))();
  DateTimeColumn get lastReminderAt => dateTime().nullable()();
}
