import 'package:flutter/material.dart';
import 'package:pharmavault/core/device/device_utility.dart';
import 'package:pharmavault/features/pos/screens/responsive/pos_products_desktop_layout.dart';
import 'package:pharmavault/features/pos/screens/responsive/pos_products_mobile_layout.dart';
import 'package:pharmavault/features/pos/screens/responsive/pos_products_tablet_layout.dart';


class PosScreen extends StatelessWidget {
  PosScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isTablet = AppDeviceUtils.isTabletScreen(context);
    final isDesktop = AppDeviceUtils.isDesktopScreen(context);

    if (isDesktop) {
      return PosDesktopscreen();
    } else if (isTablet) {
      return PosTabletScreen();
    } else {
      return PosMobilescreen();
    }
  }
}
