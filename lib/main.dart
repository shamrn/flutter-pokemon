import 'package:flutter/material.dart';
import 'package:flutter_pokemon/core/platform/splash_screen.dart';

void main() {
  runSplashScreen();
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
