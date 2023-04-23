import 'package:flutter/services.dart';
import 'package:flutter_pokemon/common/app_constants/app_colors.dart';

void setSystemUi() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.canvasColor,
      systemNavigationBarColor: AppColors.canvasColor));
}
