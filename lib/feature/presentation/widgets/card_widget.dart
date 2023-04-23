import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_pokemon/common/app_constants/app_colors.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CardWidget({Key? key, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style:
              const TextStyle(color: AppColors.primaryTextColor, fontSize: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 4,
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            AppLocalizations.of(context)!.imageCaption,
            style: const TextStyle(color: AppColors.darkenedBackgroundColor),
          ),
        ),
      ],
    );
  }
}
