import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeroai/src/bloc/theme_bloc.dart';
import 'package:zeroai/src/views/chat_body.dart';
import 'package:zeroai/src/views/login.dart';
import 'package:zeroai/src/views/onboarding.dart';
import 'package:zeroai/src/views/splashscreen.dart';

import 'model/theme_model.dart';

// final ThemeModel model = ThemeModel(ThemeType.light);
// final ThemeController controller = ThemeController(model);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeType>(builder: (context, themeType) {
      Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
      ThemeType systemTheme = platformBrightness == Brightness.light
          ? ThemeType.light
          : ThemeType.dark;
      if (themeType != systemTheme) {
        context.read<ThemeBloc>().add(ThemeEvent.toggle);
      }
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          '/onboarding': (context) => const Onboarding(),
          '/login': (context) => const Login(),
        },
        theme: _buildTheme(themeType),
      );
    });
  }

  ThemeData _buildTheme(ThemeType themeType) {
    return themeType == ThemeType.light ? ThemeData.light() : ThemeData.dark();
  }
}
