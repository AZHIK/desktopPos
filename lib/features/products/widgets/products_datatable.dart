import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmavault/core/utils/helpers.dart';
import 'package:pharmavault/widgets/loaders/animation_loader.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/assets_strings.dart';
import '../../../core/constants/sizes.dart';

class AppPaginatedDataTable extends StatelessWidget {
  const AppPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 10,
    this.onPageChanged,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.dataRowHeight = AppSizes.xl*1.5,
    this.minWidth = 1000,
    this.showCheckboxColumn = true,
    this.searchBar,
  });

  /// Columns of the table
  final List<DataColumn> columns;

  /// The data source providing rows
  final DataTableSource source;

  /// Number of rows per page
  final int rowsPerPage;

  /// Optional callback for page change
  final Function(int)? onPageChanged;

  /// Sort column index
  final int? sortColumnIndex;

  /// Whether sort is ascending
  final bool sortAscending;

  /// Row height
  final double dataRowHeight;

  /// Minimum width for scrollable table
  final double? minWidth;

  /// Whether to show row checkboxes
  final bool showCheckboxColumn;

  /// Optional search bar widget (TextField)
  final Widget? searchBar;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        if (searchBar != null)
          Padding(padding: const EdgeInsets.all(8.0), child: searchBar!),
        Expanded(
          child: Theme(
            data: Theme.of(context).copyWith(
              cardTheme:  CardThemeData(color:!dark? Colors.white:AppColors.dark, elevation: 0),
            ),
            child: PaginatedDataTable2(
              columns: columns,
              source: source,
              rowsPerPage: rowsPerPage,
              onPageChanged: onPageChanged,
              sortColumnIndex: sortColumnIndex,
              sortAscending: sortAscending,
              showCheckboxColumn: showCheckboxColumn,
              columnSpacing: 12,
              minWidth: minWidth,
              dividerThickness: 0,
              headingRowHeight: 40.0, // 👈 Add this line
              horizontalMargin: 12,
              dataRowHeight: dataRowHeight,
              showFirstLastButtons: true,
              renderEmptyRowsInTheEnd: false,
              headingTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: dark? AppColors.white : AppColors.white,
                ),
              headingRowColor: WidgetStateProperty.all(
                !dark?AppColors.primary:AppColors.darkerGrey,
              ),
              empty: AppAnimationLoaderWidget(
                animation: AppImages.packageAnimation,
                text: 'Nothing Found',
                height: 200,
                width: 200,
              ),
              headingRowDecoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.borderRadiusMd),
                  topRight: Radius.circular(AppSizes.borderRadiusMd),
                ),
              ),
              sortArrowBuilder: (bool ascending, bool sorted) {
                if (sorted) {
                  return Icon(
                    ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down,
                    size: AppSizes.iconSm,
                  );
                } else {
                  return const Icon(Iconsax.arrow_3, size: AppSizes.iconSm);
                }
              },
              onRowsPerPageChanged: (_) {},
            ),
          ),
        ),
      ],
    );
  }
}
