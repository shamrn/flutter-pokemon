// The file implements pokemon bloc widget

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_state.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/card_widget.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/snack_bar_widget.dart';

class PokemonBlocWidget<T extends PokemonBloc> extends StatelessWidget {
  // Base widget for pokemon bloc.
  // The class is implemented as a generic and takes subtypes `PokemonBloc`

  const PokemonBlocWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<T, PokemonState>(

      listenWhen: (prevState, currentState) {
        return prevState is! PokemonErrorState &&
            currentState is PokemonErrorState;
      },
      listener: (context, state) {
        if (state is PokemonErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
              snackBarWidget(context: context, message: state.errorMessage));
        }
      },

      builder: (context, state) {
        if (state is PokemonLoadedState) {
          return CardWidget(
            name: state.pokemon.name,
            imageUrl: state.pokemon.imageUrl,
          );
        } else if (state is PokemonLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox.shrink();
      },
    );
  }
}
