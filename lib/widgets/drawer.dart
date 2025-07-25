import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmavault/core/constants/assets_strings.dart';
import 'package:pharmavault/core/constants/colors.dart';
import 'package:pharmavault/core/constants/sizes.dart';
import 'package:pharmavault/core/utils/helpers.dart';
import 'package:pharmavault/widgets/app_circular_image.dart';
import 'package:pharmavault/widgets/sidebar/menu_items.dart';

class AppSideBar extends StatelessWidget {
  const AppSideBar({super.key});

  @override
  Widget build(BuildContext context) {
     final dark = AppHelperFunctions.isDarkMode(context);

    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration:BoxDecoration(
          color: dark ? Colors.black : AppColors.white,
          border: Border(
            right: BorderSide(color:dark? AppColors.dark:AppColors.grey, width: 1),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppCircularImage(
                width: 100,
                height: 100,
                image: AppImages.darkAppLogo,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MENU",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(letterSpacingDelta: 1.2),
                    ),
                    const AppMenuItem(
                        icon: Iconsax.home,
                        itemName: "Dashboard",
                        route: "/home"),
                    const AppMenuItem(
                        icon: Iconsax.shopping_cart,
                        itemName: "Cart",
                        route: "/orders"),
                    const AppMenuItem(
                        icon: Iconsax.dcube,
                        itemName: "Products",
                        route: "/products"),
                    const AppMenuItem(
                        icon: Iconsax.status,
                        itemName: "Sync status",
                        route: "/sync-status"),
                    const AppMenuItem(
                        icon: Iconsax.user,
                        itemName: "Profile",
                        route: "/checkout"),
                    const AppMenuItem(
                        icon: Iconsax.people,
                        itemName: "users",
                        route: "/users"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
