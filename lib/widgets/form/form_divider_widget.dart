import 'package:flutter/material.dart';
import 'package:pharmavault/core/constants/colors.dart';
import 'package:pharmavault/core/constants/strings.dart';
import 'package:pharmavault/core/utils/helpers.dart';


class AppFormDividerWidget extends StatelessWidget {
  const AppFormDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Flexible(child: Divider(thickness: 1, indent: 50, color: Colors.grey.withValues(alpha: 0.3), endIndent: 10)),
        Text(AppTexts as String, style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark ? AppColors.white.withValues(alpha: 0.5) : AppColors.dark.withValues(alpha: 0.5))),
        Flexible(child: Divider(thickness: 1, indent: 10, color: Colors.grey.withValues(alpha: 0.3), endIndent: 50)),
      ],
    );
  }
}
