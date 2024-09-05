import 'package:flutter/material.dart';

import 'config/app_route.dart';
import 'config/app_theme.dart';
import 'core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme().apply(fontFamily: 'Manrope'),
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.windows: ZoomPageTransitionsBuilder(),
              TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
              TargetPlatform.linux: ZoomPageTransitionsBuilder(),
              TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            }),
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homePageSelection,
      // soccerLayout,
      onGenerateRoute: AppRouter.routesGenerator,
      title: AppStrings.appName,
      theme: getAppTheme(),
    );
  }
}
