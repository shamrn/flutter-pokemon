import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/app_constants/app_colors.dart';
import 'package:flutter_pokemon/common/app_constants/app_styles.dart';

class PrimaryWidget extends StatelessWidget {
  final String screenTitle;
  final Widget child;

  const PrimaryWidget(
      {Key? key, required this.child, required this.screenTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: AppColors.primaryColor,
        ),
        shadowColor: AppColors.secondColor,
        title: Text(
          screenTitle,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: AppStyles.primaryPadding,
          child: child,
        ),
      ),
    );
  }
}
