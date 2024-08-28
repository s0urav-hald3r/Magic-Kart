import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:magickart/utils/constants/colors.dart';
import 'package:magickart/utils/device_util/device_util.dart';
import 'package:magickart/utils/helper/navigation.dart';

class XPopup {
  /// Opens a loader dialog with an indefinite circular progress indicator.
  static openLoader() {
    showDialog(
      context: Get.overlayContext!,
      useSafeArea: false,
      barrierDismissible:
          false, // Prevents dismissing the dialog by tapping outside.
      builder: (_) => WillPopScope(
        onWillPop: () => Future.value(false), // Disables back button.
        child: Container(
          color: TDeviceUtil.isDarkMode()
              ? XColor.black.withOpacity(.75)
              : XColor.white.withOpacity(.75),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: XColor.primaryColor),
              Gap(12.h),
              Text(
                'Loading...',
                style: Theme.of(Get.context!).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Hides the loader dialog by popping the current route.
  static hideLoader() => Navigation.pop();

  /// Displays a success snackbar with a custom title and message.
  static successSnackbar({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: XColor.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      icon: const Icon(Icons.thumb_up, color: XColor.white),
    );
  }

  /// Displays a warning snackbar with a custom title and message.
  static warningSnackbar({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: XColor.white,
      backgroundColor: Colors.yellow,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      icon: const Icon(Icons.warning, color: XColor.white),
    );
  }

  /// Displays an error snackbar with a custom title and message.
  static errorSnackbar({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: XColor.white,
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      icon: const Icon(Icons.gpp_bad, color: XColor.white),
    );
  }
}
