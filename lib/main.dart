import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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

// ! Status bar color & Botttom Navigation bar color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: XColor.darkerGrey));

// TODO: Initialize Firebase
// TODO: Initialize Authentication

  runApp(const App());

// ! Remove Native Splash
  FlutterNativeSplash.remove();
}
