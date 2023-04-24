// The file implements common outlined button widget

import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/app_constants/app_colors.dart';

class OutlinedButtonWidget extends StatelessWidget {
  // Class implements `OutlinedButton`.
  // The button has two states active and inactive

  final String text;
  final Size size;
  final Function onPressed;
  final bool isActive;

  const OutlinedButtonWidget(
      {Key? key,
      required this.text,
      required this.size,
      required this.onPressed,
      this.isActive = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 0.5,
          color: isActive ? AppColors.secondColor : AppColors.inActiveButton,
        ),
        backgroundColor: isActive ? null : AppColors.inActiveButton,
        fixedSize: size,
        shape: const StadiumBorder(),
      ),
      onPressed: () => onPressed(context),
      child: Text(
        text,
        style: const TextStyle(
            color: AppColors.secondColor,
            fontWeight: FontWeight.w100,
            fontSize: 22),
      ),
    );
  }
}
