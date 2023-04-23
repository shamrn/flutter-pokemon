import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_pokemon/common/app_constants/app_settings.dart';

void runSplashScreen() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Future.delayed(AppSettings.splashScreenDuration);

  FlutterNativeSplash.remove();
}
