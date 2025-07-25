import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmavault/core/constants/colors.dart';
import 'package:pharmavault/core/constants/sizes.dart';
import 'package:pharmavault/core/utils/helpers.dart';
import 'package:pharmavault/widgets/containers/rounded_container.dart';
import 'package:pharmavault/widgets/texts/section_heading.dart';

class AppDashboardCard extends StatelessWidget {
  
  const AppDashboardCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.stats,
    this.icon = Iconsax.arrow_up_3,
    this.color = AppColors.success,
    this.onTap,
  });

  final String title;
  final String subTitle;
  final int stats;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {

    final dark = AppHelperFunctions.isDarkMode(context);
    return AppRoundedContainer(
      onTap: onTap,
      backgroundColor: color,
      padding: const EdgeInsets.all(AppSizes.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Heading
          AppSectionHeading(title: title, textColor: AppColors.textSecondary),

          const SizedBox(height: AppSizes.spaceBtwSections),

          /// Content Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Subtitle Text
              Text(subTitle, style: Theme.of(context).textTheme.headlineMedium),

              /// Stats and Icon Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: color, size: AppSizes.iconSm),
                      const SizedBox(width: 4),
                      Text(
                        '$stats%',
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.apply(color:!dark?AppColors.success:const Color.fromARGB(255, 188, 255, 64)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 135,
                    child: Text(
                      'Compared to Dec 2023',
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
