// The file contains class for splash screen

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_pokemon/common/app_constants/app_settings.dart';

void runSplashScreen() async {
  // Run and duration the native splash screen

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Future.delayed(AppSettings.splashScreenDuration);

  FlutterNativeSplash.remove();
}
