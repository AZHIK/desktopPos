import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmavault/data/local/daos/users_dao.dart';
import 'package:pharmavault/data/local/database.dart';
import 'database_provider.dart';

final usersDaoProvider = Provider<UsersDao>((ref) {
  final db = ref.watch(databaseProvider);
  return UsersDao(db);
}); 
// Provider to create a user
final createUserProvider = FutureProvider.family<int, UsersCompanion>((ref, entry) async {
  final dao = ref.read(usersDaoProvider);
  return dao.createUser(entry);
});

// Provider to get a user by username
final getUserByUsernameProvider = FutureProvider.family<User?, String>((ref, username) async {
  final dao = ref.read(usersDaoProvider);
  return dao.getUserByUsername(username);
});

// Provider to get all users
final getAllUsersProvider = FutureProvider<List<User>>((ref) async {
  final dao = ref.read(usersDaoProvider);
  return dao.getAllUsers();
});

// Provider to delete a user by id
final deleteUserByIdProvider = FutureProvider.family<bool, int>((ref, id) async {
  final dao = ref.read(usersDaoProvider);
  return dao.deleteUserById(id);
});

// Provider to update user password by id
final updateUserPasswordProvider = FutureProvider.family<int, Map<String, dynamic>>((ref, params) async {
  final dao = ref.read(usersDaoProvider);
  final int id = params['id'];
  final String newPassword = params['newPassword'];
  return dao.updateUserPassword(id, newPassword);
});