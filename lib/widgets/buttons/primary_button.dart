import 'package:flutter/material.dart';
import 'button_loading_widget.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.isLoading = false,
    this.isFullWidth = true,
    this.width = 100.0,
    this.prefixIcon,
  });

  final Color color;
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final double width;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          elevation: WidgetStateProperty.all(0),
          side: WidgetStateProperty.all(BorderSide.none),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const ButtonLoadingWidget()
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    const SizedBox(width: 8),
                  ],
                  Text(text),
                ],
              ),
      ),
    );
  }
}
