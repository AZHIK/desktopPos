

import 'package:pharmavault/data/local/database.dart';

Future<void> ensureDatabaseCreated(AppDatabase db, {bool debug = false}) async {
  if (debug) {
    await db.customSelect('SELECT 1').get();
  }
}