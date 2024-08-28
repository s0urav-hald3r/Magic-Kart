import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magickart/bindings/general_bindings.dart';
import 'package:magickart/utils/constants/colors.dart';
import 'package:magickart/utils/helper/navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            appBarTheme: const AppBarTheme(
              backgroundColor: XColor.primaryColor,
              elevation: 5,
            ),
            primaryColor: XColor.primaryColor,
            scaffoldBackgroundColor: XColor.scaffoldDarkBackgroundColor,
          ),
          initialBinding: GeneralBindings(),
          navigatorKey: Navigation.navigatorKey,
          home: const NavigationBarView(),
        );
      },
    );
  }
}
