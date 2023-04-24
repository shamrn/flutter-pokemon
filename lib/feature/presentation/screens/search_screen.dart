import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_pokemon/common/widgets/primary_widget.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_state.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/card_widget.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/search_widget.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/snack_bar_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryWidget(
      screenTitle: AppLocalizations.of(context)!.nameSearchScreen,
      child: Column(
        children: [
          const SearchWidget(),
          const SizedBox(
            height: 40,
          ),
          _blocComponent(),
        ],
      ),
    );
  }

  Widget _blocComponent() {
    return BlocConsumer<PokemonBloc, PokemonState>(

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
          return const CircularProgressIndicator();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
