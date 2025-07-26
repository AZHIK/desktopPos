import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmavault/core/constants/assets_strings.dart';
import 'package:pharmavault/core/constants/colors.dart';
import 'package:pharmavault/core/constants/enums.dart';
import 'package:pharmavault/core/constants/sizes.dart';
import 'package:pharmavault/core/utils/helpers.dart';
import 'package:pharmavault/widgets/app_rouded_image.dart';
import 'package:pharmavault/widgets/appbar.dart';
import 'package:pharmavault/widgets/containers/rounded_container.dart';
import 'package:pharmavault/widgets/drawer.dart';

class PosDesktopscreen extends StatelessWidget {
  PosDesktopscreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppSideBar(),
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: dark ? AppColors.dark : AppColors.primaryBackground,
              ),
              child: Column(
                children: [
                  AppAppBar(
                    leadingIcon: Iconsax.menu,
                    leadingOnPressed: () {
                      // Open drawer using GlobalKey
                      scaffoldKey.currentState?.openDrawer();
                    },
                    actions: [
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
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: 100),
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.separated(
                                        itemCount: 10,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(height: 20),
                                        itemBuilder: (context, index) =>
                                            AppRoundedContainer(
                                              height: 90,
                                              width: 130,
                                              backgroundColor:index==0?Colors.blue:Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AppRoundedContainer(
                                height: 100,
                                backgroundColor:!dark?AppColors.white:AppColors.black,
                              ),
                              SizedBox(height: 30),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: GridView.builder(
                                    itemCount:
                                        30, // adjust based on how many containers you need
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              5, // 5 items per row, like your original
                                          crossAxisSpacing:
                                              AppSizes.spaceBtwItems,
                                          mainAxisSpacing: 20,
                                          childAspectRatio:
                                              150 / 200, // width / height
                                        ),
                                    itemBuilder: (context, index) {
                                      return AppRoundedContainer(
                                        height: 200,
                                        width: 150,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: AppSizes.spaceBtwItems),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: AppRoundedContainer(
                                    backgroundColor:dark?AppColors.dark: AppColors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 400,
                                          decoration: BoxDecoration(
                                            color: dark?Colors.black: AppColors.white,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(
                                                  10,
                                                ),
                                                bottomLeft: Radius.circular(10),
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
                          ),
                        ),
                      ],
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
