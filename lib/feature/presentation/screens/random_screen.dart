import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_pokemon/common/widgets/primary_widget.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokemon/feature/presentation/widgets/pokemon_bloc_widget.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryWidget(
        screenTitle: AppLocalizations.of(context)!.nameRandomScreen,
        child: const PokemonBlocWidget<RandomPokemonBloc>(),
    );
  }
}
