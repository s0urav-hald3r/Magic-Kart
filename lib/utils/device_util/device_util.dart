import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TDeviceUtil {
  TDeviceUtil._();

  static void hideKeyboard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandscapeOrientation() {
    return MediaQuery.of(Get.context!).orientation == Orientation.landscape;
  }

  static bool isPortraitOrientation() {
    return MediaQuery.of(Get.context!).orientation == Orientation.portrait;
  }

  static void setFullscreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible() async {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<bool> hasInternetConnection() async {
    try {
      // Look up the IP addresses for the hostname 'google.com'
      final result = await InternetAddress.lookup('google.com');
      // Check if the lookup returned any results and if the first result has a non-empty rawAddress
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isDarkMode() {
    return Theme.of(Get.context!).brightness == Brightness.dark;
  }
}
