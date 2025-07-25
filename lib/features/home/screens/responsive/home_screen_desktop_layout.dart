import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmavault/core/constants/assets_strings.dart';
import 'package:pharmavault/core/constants/colors.dart';
import 'package:pharmavault/core/constants/enums.dart';
import 'package:pharmavault/core/constants/sizes.dart';
import 'package:pharmavault/core/utils/helpers.dart';
import 'package:pharmavault/features/home/widgets/dashboard_card.dart';
import 'package:pharmavault/widgets/app_rouded_image.dart';
import 'package:pharmavault/widgets/appbar.dart';
import 'package:pharmavault/widgets/drawer.dart';

class HomeDesktopscreen extends StatelessWidget {
  HomeDesktopscreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: [
          Expanded(child: AppSideBar()),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: dark ? AppColors.black : AppColors.primaryBackground,
              ),
              child: Column(
                children: [
                  AppAppBar(
                    actions: [
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
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.defaultSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Dashboard",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          SizedBox(height: AppSizes.spaceBtwSections),

                          //cards
                          Row(
                            children: [
                              Expanded(
                                child: AppDashboardCard(
                                  stats: 25,
                                  title: "Sales Total",
                                  subTitle: "\$35.6",
                                  color: dark?Colors.black:AppColors.white,
                                ),
                              ),
                              SizedBox(width: AppSizes.spaceBtwItems),
                              Expanded(
                                child: AppDashboardCard(
                                  stats: 25,
                                  title: "Total Orders",
                                  subTitle: "\$35.6",
                                  color: dark?Colors.black:AppColors.white,
                                ),
                              ),

                              SizedBox(width: AppSizes.spaceBtwItems,),
                              Expanded(
                                child: AppDashboardCard(
                                  stats: 25,
                                  title: "Visitors",
                                  subTitle: "\$35.6",
                                  color: dark?Colors.black:AppColors.white,
                                ),
                              )
                            ],
                          ),
                        ],
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
}
