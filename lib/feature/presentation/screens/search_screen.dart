import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_pokemon/common/widgets/primary_widget.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/pokemon_bloc_widget.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryWidget(
      screenTitle: AppLocalizations.of(context)!.nameSearchScreen,
      child: Column(
        children: const [
          SearchWidget(),
          SizedBox(
            height: 40,
          ),
          PokemonBlocWidget<SearchPokemonBloc>(),
        ],
      ),
    );
  }
}
