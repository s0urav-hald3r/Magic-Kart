import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magickart/common/controllers/navigation_bar_controller.dart';
import 'package:magickart/utils/constants/colors.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  final controller = NavigationBarController.instance;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      makeAPIs();
    });
  }

  Future<void> makeAPIs() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(() => _buildBody()),
          Obx(() => _buildBottomNavigationBar()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return [
      Container(),
      Container(),
    ][controller.screenIndex];
  }

  Widget _buildBottomNavigationBar() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        elevation: 10,
        indicatorColor: XColor.primaryColor,
        backgroundColor: XColor.darkerGrey,
        labelTextStyle: WidgetStateProperty.all(
          GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500),
        ),
      ),
      child: NavigationBar(
        height: 55.h,
        selectedIndex: controller.screenIndex,
        onDestinationSelected: (value) => controller.screenIndex = value,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          NavigationDestination(
              icon: Icon(
                Icons.home,
                size: 24.sp,
              ),
              selectedIcon: Icon(
                Icons.home,
                size: 24.sp,
                color: XColor.darkerGrey,
              ),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(
                Icons.favorite,
                size: 24.sp,
              ),
              selectedIcon: Icon(
                Icons.favorite,
                size: 24.sp,
                color: XColor.darkerGrey,
              ),
              label: 'Wishlists'),
        ],
      ),
    );
  }
}
