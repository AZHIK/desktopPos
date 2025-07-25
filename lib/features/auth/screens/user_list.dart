import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmavault/core/constants/assets_strings.dart';
import 'package:pharmavault/core/constants/enums.dart';
import 'package:pharmavault/core/constants/sizes.dart';
import 'package:pharmavault/core/device/device_utility.dart';
import 'package:pharmavault/data/local/database.dart';
import 'package:pharmavault/features/products/widgets/products_datatable.dart';
import 'package:pharmavault/providers/users_dao_provider.dart';
import 'package:pharmavault/widgets/app_rouded_image.dart';
import 'package:pharmavault/widgets/appbar.dart';
import 'package:pharmavault/widgets/drawer.dart';
import 'package:pharmavault/widgets/form_fields.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<User> filteredUsers = [];
  int? _sortColumnIndex;
  bool _sortAscending = true;
  String _searchQuery = '';

  void _onSearch(String query, List<User> allUsers) {
    setState(() {
      _searchQuery = query.toLowerCase();
      filteredUsers = allUsers.where((user) {
        return user.username.toLowerCase().contains(_searchQuery) ||
            user.password.toLowerCase().contains(_searchQuery) ||
            user.id.toString().contains(_searchQuery);
      }).toList();
    });
  }

  void _onSort<T>(
    int columnIndex,
    bool ascending,
    Comparable<T> Function(User user) getField,
  ) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
      filteredUsers.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(getAllUsersProvider);
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
            child: Column(
              children: [
                AppAppBar(
                  leadingIcon: !isDesktop ? Iconsax.menu : null,
                  leadingOnPressed: () =>
                      scaffoldKey.currentState?.openDrawer(),
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
                const SizedBox(height: 20),

                /// ✅ Display table
                Expanded(
                  child: usersAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text('Error: $e')),
                    data: (users) {
                      // Update filtered list on first load
                      if (filteredUsers.isEmpty || _searchQuery.isEmpty) {
                        filteredUsers = users;
                      }

                      return AppPaginatedDataTable(
                        columns: [
                          DataColumn(
                            label: const Text("ID"),
                            onSort: (i, asc) => _onSort(i, asc, (u) => u.id),
                          ),
                          DataColumn(
                            label: const Text("Username"),
                            onSort: (i, asc) =>
                                _onSort(i, asc, (u) => u.username),
                          ),
                          DataColumn(
                            label: const Text("Password"),
                            onSort: (i, asc) =>
                                _onSort(i, asc, (u) => u.password),
                          ),
                        ],
                        source: UserDataTableSource(
                          users: filteredUsers,
                          context: context,
                        ),
                        sortColumnIndex: _sortColumnIndex,
                        sortAscending: _sortAscending,
                        searchBar: AppSearchFormField(
                          hint: "search anything",
                          onChanged: (query) => _onSearch(query, users),
                          width: 300,
                          alignment: Alignment.centerRight,
                          
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserDataTableSource extends DataTableSource {
  final List<User> users;
  final BuildContext context;
  final Set<int> _selectedIndexes = {};

  UserDataTableSource({required this.users, required this.context});

  @override
  DataRow? getRow(int index) {
    if (index >= users.length) return null;
    final user = users[index];
    final isSelected = _selectedIndexes.contains(index);

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
        DataCell(Text(user.id.toString())),
        DataCell(Text(user.username)),
        DataCell(Text(user.password)),
      ],
    );
  }

  @override
  int get rowCount => users.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedIndexes.length;
}
