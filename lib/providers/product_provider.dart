import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmavault/data/local/database.dart';
import 'package:pharmavault/data/local/daos/product_dao.dart';
import 'database_provider.dart';

// DAO Provider
final productDaoProvider = Provider<ProductDao>((ref) {
  final db = ref.read(databaseProvider);
  return db.productDao;
});

// All products
final allProductsProvider = FutureProvider<List<Product>>((ref) async {
  return ref.read(productDaoProvider).getAllProducts();
});

// Add new product
Future<void> addNewProduct({
  required WidgetRef ref,
  required String name,
  required double retailPrice,
  required double wholesalePrice,
  double? retailPriceWithTax,
  double? wholesalePriceWithTax,
  String? description,
}) async {
  final dao = ref.read(productDaoProvider);

  final product = ProductsCompanion(
    name: Value(name),
    retailPrice: Value(retailPrice),
    wholesalePrice: Value(wholesalePrice),
    retailPriceWithTax: Value(retailPriceWithTax),
    wholesalePriceWithTax: Value(wholesalePriceWithTax),
    description: Value(description),
    createdAt: Value(DateTime.now()),
  );

  await dao.insertProduct(product);
}
