import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmavault/core/constants/colors.dart';
import 'package:pharmavault/core/constants/sizes.dart';

class AppMenuItem extends StatelessWidget {
  final String route;
  final IconData icon;
  final String itemName;

  const AppMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final isActive = currentRoute == route;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
      child: InkWell(
        onTap: () {
          if (!isActive) {
            context.go(route);
          }
        },
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
        child: Container(
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.lg,
                  top: AppSizes.sm,
                  bottom: AppSizes.sm,
                  right: AppSizes.md,
                ),
                child: Icon(
                  icon,
                  color: isActive ? AppColors.white : AppColors.darkGrey,
                ),
              ),
              Text(
                itemName,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isActive ? AppColors.white : AppColors.darkGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
