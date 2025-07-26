import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:pharmavault/core/utils/file_saver.dart';
import 'package:pharmavault/data/local/database.dart';
import 'package:pharmavault/providers/product_provider.dart';

/// DataGridSource based on Product model:
class ProductExportDataSource extends DataGridSource {
  ProductExportDataSource({required List<Product> products}) {
    _rows = products.map<DataGridRow>((p) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'ID', value: p.id),
        DataGridCell<String>(columnName: 'Name', value: p.name),
        DataGridCell<double>(columnName: 'Retail Price', value: p.retailPrice),
        DataGridCell<double>(columnName: 'Wholesale Price', value: p.wholesalePrice),
        DataGridCell<double>(columnName: 'Retail + Tax', value: p.retailPriceWithTax ?? 0),
        DataGridCell<double>(columnName: 'Wholesale + Tax', value: p.wholesalePriceWithTax ?? 0),
        DataGridCell<String>(columnName: 'Description', value: p.description ?? ''),
      ]);
    }).toList();
  }

  late final List<DataGridRow> _rows;

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}

/// Shared GlobalKey to access SfDataGridState:
final GlobalKey<SfDataGridState> _exportGridKey = GlobalKey<SfDataGridState>();

/// Export to Excel using SfDataGridState
Future<void> exportProductsToExcel(WidgetRef ref) async {
  final products = await ref.read(allProductsProvider.future);
  final dataSource = ProductExportDataSource(products: products);

  // Build an invisible SfDataGrid for exporting
  final grid = SfDataGrid(
    key: _exportGridKey,
    source: dataSource,
    columns: [
      GridColumn(columnName: 'ID', label: const Text('ID')),
      GridColumn(columnName: 'Name', label: const Text('Name')),
      GridColumn(columnName: 'Retail Price', label: const Text('Retail Price')),
      GridColumn(columnName: 'Wholesale Price', label: const Text('Wholesale Price')),
      GridColumn(columnName: 'Retail + Tax', label: const Text('Retail + Tax')),
      GridColumn(columnName: 'Wholesale + Tax', label: const Text('Wholesale + Tax')),
      GridColumn(columnName: 'Description', label: const Text('Description')),
    ],
  );

  // Trigger frame so state is available:
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final state = _exportGridKey.currentState!;
    final xlsio.Workbook workbook = state.exportToExcelWorkbook();
    final bytes = workbook.saveAsStream();
    workbook.dispose();
    saveAndLaunchFile(bytes, 'products_export.xlsx');
  });

  // Add to widget tree temporarily (if necessary, though not required on desktop)
}

/// Export to PDF using SfDataGridState
Future<void> exportProductsToPdf(WidgetRef ref) async {
  final products = await ref.read(allProductsProvider.future);
  final dataSource = ProductExportDataSource(products: products);

  final grid = SfDataGrid(
    key: _exportGridKey,
    source: dataSource,
    columns: [
      GridColumn(columnName: 'ID', label: const Text('ID')),
      GridColumn(columnName: 'Name', label: const Text('Name')),
      GridColumn(columnName: 'Retail Price', label: const Text('Retail Price')),
      GridColumn(columnName: 'Wholesale Price', label: const Text('Wholesale Price')),
      GridColumn(columnName: 'Retail + Tax', label: const Text('Retail + Tax')),
      GridColumn(columnName: 'Wholesale + Tax', label: const Text('Wholesale + Tax')),
      GridColumn(columnName: 'Description', label: const Text('Description')),
    ],
  );

  WidgetsBinding.instance.addPostFrameCallback((_) {
    final state = _exportGridKey.currentState!;
    final PdfDocument document = state.exportToPdfDocument(
      fitAllColumnsInOnePage: true,
    );
    final bytes = document.saveSync();
    document.dispose();
    saveAndLaunchFile(bytes, 'products_export.pdf');
  });
}
