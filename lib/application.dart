import 'package:flutter/material.dart';

import 'core/router/router.dart';
import 'features/component/color.dart';
import 'features/component/color/color_theme.dart';
import 'gen/fonts.gen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          primary: ColorTheme.heatmap2,
          seedColor: ColorTheme.heatmap2,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: CustomColor.transparent,
        highlightColor: CustomColor.transparent,
        splashColor: CustomColor.transparent,
        fontFamily: FontFamily.lINESeedJP,
      ),
      themeMode: ThemeMode.dark,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
