import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_pokemon/common/app_constants/app_styles.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/outlined_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaDataSize = MediaQuery.of(context).size;
    Size buttonSize =
        Size(mediaDataSize.width / 1.3, mediaDataSize.height / 10);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppStyles.primaryPadding,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButtonWidget(
                    text: AppLocalizations.of(context)!.nameSearchScreen,
                    size: buttonSize,
                    onPressed: _searchPokemonOnPressed),
                const SizedBox(
                  height: 16,
                ),
                OutlinedButtonWidget(
                    text: AppLocalizations.of(context)!.nameRandomScreen,
                    size: buttonSize,
                    onPressed: _getRandomPokemonOnPressed),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _searchPokemonOnPressed(BuildContext context) {
    Navigator.of(context).pushNamed('/search');
  }

  void _getRandomPokemonOnPressed(BuildContext context) {
    Navigator.of(context).pushNamed('/random');
  }
}
