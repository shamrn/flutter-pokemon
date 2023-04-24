import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_pokemon/common/app_constants/app_colors.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_event.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _pokemonNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const double height = 60;

  @override
  void dispose() {
    _pokemonNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
              minWidth: double.infinity,
              // For correctly render error messages
              minHeight: height,
              maxHeight: height * 2),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: _pokemonNameController,
            validator: (value) => _validation(value),
            decoration: _inputDecoration,
            style: const TextStyle(color: AppColors.secondColor),
          ),
        ));
  }

  Widget _button() {
    return ClipOval(
      child: Material(
        color: AppColors.secondColor,
        child: InkWell(
          splashColor: AppColors.darkenedBackgroundColor,
          splashFactory: InkRipple.splashFactory,
          onTap: () {
            if (_formKey.currentState!.validate()) {
              context.read<SearchPokemonBloc>().add(
                  SearchPokemonLoadEvent(name: _pokemonNameController.text));
            }
          },
          child: const SizedBox(
            width: height,
            height: height,
            child: Icon(
              Icons.search,
              color: AppColors.primaryColor,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }

  String? _validation(String? value) {
    {
      if (value == null || value.isEmpty) {
        return AppLocalizations.of(context)!.textValidationRequiredField;
      }
      return null;
    }
  }

  InputDecoration get _inputDecoration {
    return InputDecoration(
      suffixIcon: _button(),
      hintText: AppLocalizations.of(context)!.textSearchField,
      hintMaxLines: 1,
      hintStyle: const TextStyle(
          color: AppColors.darkenedBackgroundColor, fontSize: 18),
      enabledBorder: _outlineInputBorder,
      focusedBorder: _outlineInputBorder,
      errorBorder: _outlineInputBorder,
      focusedErrorBorder: _outlineInputBorder,
    );
  }

  OutlineInputBorder get _outlineInputBorder {
    // The method returns a common `OutlineInputBorder`

    return const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkenedBackgroundColor),
        borderRadius: BorderRadius.all(Radius.circular(30)));
  }
}
