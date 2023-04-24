// The file implements the home screen

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_pokemon/common/app_constants/app_styles.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_event.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon_number/pokemon_number_cubit.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon_number/pokemon_number_state.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/outlined_button_widget.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/snack_bar_widget.dart';

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

                // Change the button to active and inactive
                BlocBuilder<PokemonNumberCubit, PokemonNumberState>(
                  builder: (context, state) {
                    return OutlinedButtonWidget(
                      text: AppLocalizations.of(context)!.nameRandomScreen,
                      size: buttonSize,
                      onPressed: _getRandomPokemonOnPressed,
                      isActive:
                          state is PokemonNumberLoadedState ? true : false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _searchPokemonOnPressed(BuildContext context) {
    // The method is called when the user presses the 'search' button

    Navigator.of(context).pushNamed('/search');
  }

  void _getRandomPokemonOnPressed(BuildContext context) {
    // The method is called when the user presses the 'get random pokemon' button

    PokemonNumberCubit pokemonNumberCubit = context.read<PokemonNumberCubit>();
    PokemonNumberState pokemonNumberState = pokemonNumberCubit.state;

    // If we got the number of pokemon. Load a random pokemon and open random screen
    if (pokemonNumberState is PokemonNumberLoadedState) {
      context
          .read<RandomPokemonBloc>()
          .add(RandomPokemonLoadEvent(number: pokemonNumberState.number));
      Navigator.of(context).pushNamed('/random');

    // If the method of getting the number of pokemon is still loading or
    // error is received show the user snack bar
    } else if (pokemonNumberState is PokemonNumberLoadingState) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarWidget(
          context: context,
          message: AppLocalizations.of(context)!.randomPokemonLoading));
    } else if (pokemonNumberState is PokemonNumberErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarWidget(
          context: context,
          message: AppLocalizations.of(context)!.randomPokemonNotAvailable));
    }
  }
}
