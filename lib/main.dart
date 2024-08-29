import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:magickart/app.dart';
import 'package:magickart/utils/constants/colors.dart';

Future<void> main() async {
// ! Add Widgets Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

// ! Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// ! Fixed Portrait Orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

// ! Init Local Storage
  await GetStorage.init();

// ! Status bar color & Botttom Navigation bar color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: XColor.darkerGrey));

  runApp(const App());

// ! Remove Native Splash
  FlutterNativeSplash.remove();
}
