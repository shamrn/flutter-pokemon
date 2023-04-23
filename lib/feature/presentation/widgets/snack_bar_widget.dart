// The file implements snack bar

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_pokemon/common/app_constants/app_colors.dart';

SnackBar snackBarWidget({
  required BuildContext context,
  required String message,
}) {
  // Base snack bar widget

  return SnackBar(
    content: Text(message,
        style:
            const TextStyle(fontSize: 18, color: AppColors.primaryTextColor)),
    action: SnackBarAction(
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      label: AppLocalizations.of(context)!.actionSnackBar,
    ),
  );
}
