import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmavault/core/constants/assets_strings.dart';
import 'package:pharmavault/core/constants/colors.dart';
import 'package:pharmavault/core/constants/enums.dart';
import 'package:pharmavault/core/constants/sizes.dart';
import 'package:pharmavault/core/device/device_utility.dart';
import 'package:pharmavault/core/utils/helpers.dart';
import 'package:pharmavault/data/local/database.dart';
import 'package:pharmavault/features/products/widgets/data_export.dart';
import 'package:pharmavault/features/products/widgets/products_datatable.dart';
import 'package:pharmavault/providers/product_provider.dart';
import 'package:pharmavault/widgets/app_rouded_image.dart';
import 'package:pharmavault/widgets/appbar.dart';
import 'package:pharmavault/widgets/buttons/primary_button.dart';
import 'package:pharmavault/widgets/containers/rounded_container.dart';
import 'package:pharmavault/widgets/drawer.dart';
import 'package:pharmavault/widgets/form_fields.dart';

class ProductsList extends ConsumerStatefulWidget {
  const ProductsList({super.key});

  @override
  ConsumerState<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends ConsumerState<ProductsList> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final wholesalePriceController = TextEditingController();
  final retailPriceWithTaxController = TextEditingController();
  final wholesalePriceWithTaxController = TextEditingController();

  int? _sortColumnIndex;
  bool _sortAscending = true;
  String _searchQuery = '';
  List<Product> filteredProducts = [];

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    wholesalePriceController.dispose();
    retailPriceWithTaxController.dispose();
    wholesalePriceWithTaxController.dispose();
    super.dispose();
  }

  void _onSearch(String query, List<Product> allProducts) {
    setState(() {
      _searchQuery = query;
      filteredProducts = allProducts
          .where(
            (product) =>
                product.name.toLowerCase().contains(query.toLowerCase()) ||
                product.description?.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ==
                    true,
          )
          .toList();
    });
  }

  void _showAddProductDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text('Add New Product'),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppTextFormField(
                    label: "Product Name",
                    controller: nameController,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  AppTextFormField(
                    label: "Retail Price",
                    controller: priceController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  AppTextFormField(
                    label: "Wholesale Price",
                    controller: wholesalePriceController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  AppTextFormField(
                    label: "Retail Price with Tax",
                    controller: retailPriceWithTaxController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  AppTextFormField(
                    label: "Wholesale Price with Tax",
                    controller: wholesalePriceWithTaxController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            AppPrimaryButton(
              color: AppColors.primary,
              text: 'Add',
              width: 100,
              isFullWidth: false,
              onPressed: () async {
                final name = nameController.text.trim();
                final retailPrice = double.tryParse(priceController.text) ?? 0;
                final wholesalePrice =
                    double.tryParse(wholesalePriceController.text) ?? 0;
                final retailTax = double.tryParse(
                  retailPriceWithTaxController.text,
                );
                final wholesaleTax = double.tryParse(
                  wholesalePriceWithTaxController.text,
                );

                if (name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Product name can't be empty."),
                    ),
                  );
                  return;
                }

                await addNewProduct(
                  ref: ref,
                  name: name,
                  retailPrice: retailPrice,
                  wholesalePrice: wholesalePrice,
                  retailPriceWithTax: retailTax,
                  wholesalePriceWithTax: wholesaleTax,
                  description: '',
                );

                ref.refresh(allProductsProvider);

                nameController.clear();
                priceController.clear();
                wholesalePriceController.clear();
                retailPriceWithTaxController.clear();
                wholesalePriceWithTaxController.clear();

                if (mounted) Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(allProductsProvider);
    final isDesktop = AppDeviceUtils.isDesktopScreen(context);
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      key: scaffoldKey,
      drawer: !isDesktop ? const AppSideBar() : null,
      body: Row(
        children: [
          if (isDesktop) const Expanded(child: AppSideBar()),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: !dark ? AppColors.primaryBackground : AppColors.dark,
              ),
              child: Column(
                children: [
                  AppAppBar(
                    leadingIcon: !isDesktop ? Iconsax.menu : null,
                    leadingOnPressed: () =>
                        scaffoldKey.currentState?.openDrawer(),
                    actions: [
                      IconButton(
                        icon: const Icon(Iconsax.notification),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      const AppRoundedImage(
                        imageType: ImageType.asset,
                        image: AppImages.user,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppSizes.spaceBtwItems,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Products",
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(
                                color: dark
                                    ? AppColors.darkGrey
                                    : AppColors.darkerGrey,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AppRoundedContainer(
                        showBorder: true,
                        padding: EdgeInsets.only(top: 20,left: 8,right: 8),
                        borderColor: !dark
                            ? AppColors.darkGrey
                            : AppColors.darkerGrey,
                        backgroundColor: dark ? Colors.black : AppColors.white,
                        child: productsAsync.when(
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (e, _) => Center(child: Text('Error: $e')),
                          data: (products) {
                            if (_searchQuery.isEmpty) {
                              filteredProducts = products;
                            }

                            return AppPaginatedDataTable(
                              columns: _buildColumns(products),
                              source: ProductDataTableSource(
                                products: filteredProducts,
                                context: context,
                              ),
                              sortColumnIndex: _sortColumnIndex,
                              sortAscending: _sortAscending,
                              searchBar: AppSearchFormField(
                                hint: "Search...",
                                onChanged: (query) =>
                                    _onSearch(query, products),
                                width: 200,
                              ),
                              addButton: AppPrimaryButton(
                                color: const Color.fromARGB(255, 117, 140, 255),
                                text: "+ Add",
                                width: 80,
                                isFullWidth: false,
                                onPressed: () => _showAddProductDialog(context),
                              ),
                              excelExportButton: AppPrimaryButton(
                                color: const Color.fromARGB(255, 92, 219, 88),
                                text: "Excel",
                                width: 100,
                                isFullWidth: false,
                                prefixIcon: Icon(Iconsax.export_1),
                                onPressed: () => exportProductsToExcel(ref),
                              ),
                              pdfExportButton: AppPrimaryButton(
                                color: const Color.fromARGB(255, 252, 113, 113),
                                text: "PDF",
                                width: 100,
                                isFullWidth: false,
                                prefixIcon: Icon(Icons.picture_as_pdf),
                                onPressed: () => exportProductsToPdf(ref),
                              ),
                            );
                          },
                        ),
                      ),
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

  List<DataColumn> _buildColumns(List<Product> products) {
    return [
      _column("ID", (a, b) => a.id.compareTo(b.id), 0),
      _column(
        "Name",
        (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        1,
      ),
      _column(
        "Retail Price",
        (a, b) => a.retailPrice.compareTo(b.retailPrice),
        2,
      ),
      _column(
        "Wholesale Price",
        (a, b) => a.wholesalePrice.compareTo(b.wholesalePrice),
        3,
      ),
      _column(
        "Retail + Tax",
        (a, b) =>
            (a.retailPriceWithTax ?? 0).compareTo(b.retailPriceWithTax ?? 0),
        4,
      ),
      _column(
        "Wholesale + Tax",
        (a, b) => (a.wholesalePriceWithTax ?? 0).compareTo(
          b.wholesalePriceWithTax ?? 0,
        ),
        5,
      ),
      _column(
        "Description",
        (a, b) => (a.description ?? '').compareTo(b.description ?? ''),
        6,
      ),
    ];
  }

  DataColumn _column(
    String label,
    int Function(Product, Product) comparator,
    int index,
  ) {
    return DataColumn(
      label: Text(label),
      onSort: (columnIndex, ascending) {
        setState(() {
          _sortColumnIndex = columnIndex;
          _sortAscending = ascending;
          filteredProducts.sort(
            (a, b) => ascending ? comparator(a, b) : comparator(b, a),
          );
        });
      },
    );
  }
}

class ProductDataTableSource extends DataTableSource {
  final List<Product> products;
  final BuildContext context;
  final Set<int> _selectedIndexes = {};

  ProductDataTableSource({required this.products, required this.context});

  @override
  DataRow getRow(int index) {
    if (index >= products.length) return const DataRow(cells: []);
    final product = products[index];
    final isSelected = _selectedIndexes.contains(index);
    final dark = AppHelperFunctions.isDarkMode(context);
    return DataRow.byIndex(
      index: index,
      selected: isSelected,
      onSelectChanged: (selected) {
        if (selected == null) return;
        if (selected) {
          _selectedIndexes.add(index);
        } else {
          _selectedIndexes.remove(index);
        }
        notifyListeners();
      },
      cells: [
        DataCell(
          Text(
            product.id.toString(),
            style: TextStyle(
              color: !dark ? AppColors.dark : AppColors.darkGrey,
            ),
          ),
        ),
        DataCell(
          Text(
            product.name,
            style: TextStyle(
              color: !dark ? AppColors.dark : AppColors.darkGrey,
            ),
          ),
        ),
        DataCell(
          Text(
            product.retailPrice.toStringAsFixed(2),
            style: TextStyle(
              color: !dark ? AppColors.dark : AppColors.darkGrey,
            ),
          ),
        ),
        DataCell(
          Text(
            product.wholesalePrice.toStringAsFixed(2),
            style: TextStyle(
              color: !dark ? AppColors.dark : AppColors.darkGrey,
            ),
          ),
        ),
        DataCell(
          Text(
            (product.retailPriceWithTax ?? 0).toStringAsFixed(2),
            style: TextStyle(
              color: !dark ? AppColors.dark : AppColors.darkGrey,
            ),
          ),
        ),
        DataCell(
          Text(
            (product.wholesalePriceWithTax ?? 0).toStringAsFixed(2),
            style: TextStyle(
              color: !dark ? AppColors.dark : AppColors.darkGrey,
            ),
          ),
        ),
        DataCell(
          Text(
            product.description ?? '—',
            style: TextStyle(
              color: !dark ? AppColors.dark : AppColors.darkGrey,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products.length;

  @override
  int get selectedRowCount => _selectedIndexes.length;
}
