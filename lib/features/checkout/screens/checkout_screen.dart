import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmavault/core/constants/assets_strings.dart';
import 'package:pharmavault/core/constants/enums.dart';
import 'package:pharmavault/core/constants/sizes.dart';
import 'package:pharmavault/core/device/device_utility.dart';
import 'package:pharmavault/widgets/app_rouded_image.dart';
import 'package:pharmavault/widgets/appbar.dart';
import 'package:pharmavault/widgets/drawer.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                  leadingOnPressed: () {
                    // Open drawer using GlobalKey
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
                    Row(
                      children: const [
                        AppRoundedImage(
                          imageType: ImageType.asset,
                          image: AppImages.user,
                        ),
                      ],
                    ),
                  ],
                ),
                // Your main content goes here
                const SizedBox(height: 20),
                const Center(child: Text("Main Content Area")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
