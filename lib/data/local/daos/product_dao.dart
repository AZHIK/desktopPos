import 'package:drift/drift.dart';
import 'package:pharmavault/data/local/tables/products.dart';
import '../database.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [Products])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(super.db);

  // Create
  Future<int> insertProduct(ProductsCompanion product) =>
      into(products).insert(product);

  // Read - All
  Future<List<Product>> getAllProducts() =>
      select(products).get();

  // Read - Single
  Future<Product?> getProductById(int id) =>
      (select(products)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  // Update
  Future<bool> updateProduct(Product product) =>
      update(products).replace(product);

  // Delete
  Future<int> deleteProduct(int id) =>
      (delete(products)..where((tbl) => tbl.id.equals(id))).go();
}
