import 'package:flutter/material.dart';
import 'package:pharmavault/core/device/device_utility.dart';
import 'package:pharmavault/features/home/screens/responsive/home_screen_desktop_layout.dart';
import 'package:pharmavault/features/home/screens/responsive/home_screen_mobile_layout.dart';
import 'package:pharmavault/features/home/screens/responsive/home_screen_tablet_layout.dart';


class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isTablet = AppDeviceUtils.isTabletScreen(context);
    final isDesktop = AppDeviceUtils.isDesktopScreen(context);

    if (isDesktop) {
      return HomeDesktopscreen();
    } else if (isTablet) {
      return HomesTabletScreen();
    } else {
      return HomeMobilescreen();
    }
  }
}
