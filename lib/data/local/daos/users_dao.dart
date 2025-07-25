// lib/data/daos/users_dao.dart

import 'package:drift/drift.dart';
import 'package:pharmavault/data/local/tables/users.dart';
import '../database.dart';

part 'users_dao.g.dart';

@DriftAccessor(tables: [Users])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  UsersDao(super.db);

  Future<int> createUser(UsersCompanion entry) {
    return into(users).insert(entry);
  }

  Future<User?> getUserByUsername(String username) {
    return (select(users)..where((u) => u.username.equals(username))).getSingleOrNull();
  }

  Future<List<User>> getAllUsers() {
    return select(users).get();
  }

  Future<bool> deleteUserById(int id) {
    return (delete(users)..where((u) => u.id.equals(id))).go().then((rows) => rows > 0);
  }

  Future<int> updateUserPassword(int id, String newPassword) {
    return (update(users)..where((u) => u.id.equals(id))).write(
      UsersCompanion(password: Value(newPassword)),
    );
  }
}
