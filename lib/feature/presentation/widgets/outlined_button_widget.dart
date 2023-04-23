import 'package:flutter/material.dart';
import 'package:flutter_pokemon/common/app_constants/app_colors.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final String text;
  final Size size;
  final Function onPressed;

  const OutlinedButtonWidget(
      {Key? key,
      required this.text,
      required this.size,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          width: 0.5,
          color: AppColors.secondColor,
        ),
        fixedSize: size,
        shape: const StadiumBorder(),
        //    padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 24)
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
