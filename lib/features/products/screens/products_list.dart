import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmavault/core/constants/assets_strings.dart';
import 'package:pharmavault/core/constants/colors.dart';
import 'package:pharmavault/core/constants/enums.dart';
import 'package:pharmavault/core/constants/sizes.dart';
import 'package:pharmavault/core/device/device_utility.dart';
import 'package:pharmavault/data/local/database.dart';
import 'package:pharmavault/features/products/widgets/products_datatable.dart';
import 'package:pharmavault/providers/product_provider.dart';
import 'package:pharmavault/widgets/app_rouded_image.dart';
import 'package:pharmavault/widgets/appbar.dart';
import 'package:pharmavault/widgets/drawer.dart';

class ProductsList extends ConsumerWidget {
  ProductsList({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(allProductsProvider);
    final isMobile = AppDeviceUtils.isMobileScreen(context);
    final isTablet = AppDeviceUtils.isTabletScreen(context);
    final isDesktop = AppDeviceUtils.isDesktopScreen(context);

    return Scaffold(
      key: scaffoldKey,
      drawer: !isDesktop ? const AppSideBar() : null,
      body: Row(
        children: [
          if (isDesktop) const Expanded(child: AppSideBar()),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryBackground
              ),
              child: Column(
                children: [
                  AppAppBar(
                    leadingIcon: !isDesktop ? Iconsax.menu : null,
                    leadingOnPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    actions: [
                      if (isDesktop)
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.search_normal),
                        ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.notification),
                      ),
                      const SizedBox(width: AppSizes.spaceBtwItems / 2),
                      const AppRoundedImage(
                        imageType: ImageType.asset,
                        image: AppImages.user,
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
              
                  /// ✅ Display the data table using the fetched products
                  Expanded(
                    child: productsAsync.when(
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (e, _) => Center(child: Text('Error: $e')),
                      data: (products) {
                        final source = ProductDataTableSource(products: products, context: context);
                        return AppPaginatedDataTable(
                          columns: const [
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Retail Price')),
                            DataColumn(label: Text('Wholesale Price')),
                            DataColumn(label: Text('Retail Price + Tax')),
                            DataColumn(label: Text('Wholesale Price + Tax')),
                            DataColumn(label: Text('Description')),
                          ],
                          source: source,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ProductDataTableSource extends DataTableSource {
  final List<Product> products;
  final BuildContext context;

  ProductDataTableSource({
    required this.products,
    required this.context,
  });

  @override
  DataRow getRow(int index) {
    if (index >= products.length) return const DataRow(cells: []);
    final product = products[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(product.id.toString())),
        DataCell(Text(product.name)),
        DataCell(Text(product.retailPrice.toStringAsFixed(2))),
        DataCell(Text(product.wholesalePrice.toStringAsFixed(2))),
        DataCell(Text((product.retailPriceWithTax ?? 0).toStringAsFixed(2))),
        DataCell(Text((product.wholesalePriceWithTax ?? 0).toStringAsFixed(2))),
        DataCell(Text(product.description ?? '—')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products.length;

  @override
  int get selectedRowCount => 0;
}