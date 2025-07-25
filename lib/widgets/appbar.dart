
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pharmavault/core/constants/colors.dart';
import 'package:pharmavault/core/device/device_utility.dart';
import 'package:pharmavault/core/utils/helpers.dart';
import 'package:go_router/go_router.dart';


class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return AppBar(
      backgroundColor:dark?Colors.black:AppColors.white ,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Iconsax.arrow_left, color: dark ? AppColors.white : AppColors.dark),
            )
          : leadingIcon != null
              ? IconButton(
                  onPressed: leadingOnPressed,
                  icon: Icon(leadingIcon, color: dark ? AppColors.white : AppColors.dark),
                )
              : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
