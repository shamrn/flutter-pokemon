import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_pokemon/common/app_constants/app_settings.dart';
import 'package:flutter_pokemon/common/l10n/l10n.dart';
import 'package:flutter_pokemon/common/utils/convert_color.dart';
import 'package:flutter_pokemon/core/platform/splash_screen.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokemon/feature/presentation/blocs/pokemon_number/pokemon_number_cubit.dart';
import 'package:flutter_pokemon/feature/presentation/screens/random_screen.dart';
import 'package:flutter_pokemon/feature/presentation/screens/search_screen.dart';

import 'common/app_constants/app_colors.dart';
import 'core/platform/system_ui.dart';
import 'feature/presentation/screens/home_screen.dart';

void main() {
  setSystemUi();
  runSplashScreen();
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchPokemonBloc>(
            create: (context) => SearchPokemonBloc()),
        BlocProvider<RandomPokemonBloc>(
            create: (context) => RandomPokemonBloc()),
        BlocProvider<PokemonNumberCubit>(
            create: (context) => PokemonNumberCubit()..loadPokemonNumber()),
      ],
      child: MaterialApp(
        // Ui settings
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: AppColors.canvasColor,
          primarySwatch: convertHexToMaterialColor(AppColors.secondColor),
        ),

        // Localization
        locale: AppSettings.defaultLocale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all,

        // Routes
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/search': (context) => const SearchScreen(),
          '/random': (context) => const RandomScreen(),
        },
      ),
    );
  }
}
