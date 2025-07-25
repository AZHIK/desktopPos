import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmavault/data/local/daos/product_dao.dart';
import 'package:pharmavault/providers/database_provider.dart';



// DAO provider
final productDaoProvider = Provider<ProductDao>((ref) {
  final db = ref.read(databaseProvider);
  return db.productDao;
});

// All products stream
final allProductsProvider = FutureProvider((ref) async {
  final dao = ref.read(productDaoProvider);
  return dao.getAllProducts();
});

// Single product by ID
final productByIdProvider = FutureProvider.family((ref, int id) async {
  final dao = ref.read(productDaoProvider);
  return dao.getProductById(id);
});
