import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/navigation/no_route.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/widget_extensions.dart';
import 'package:fotowah_cmf/app/src/home/home_screen.dart';
import 'package:fotowah_cmf/app/src/quran/models/quran_circle_model.dart';
import 'package:fotowah_cmf/app/src/quran/screens/quran_home_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static Route<dynamic> appRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.route:
        return const HomeScreen().wrapper;
      case QuranHomeScreen.route:
        final quranCircle =
            settings.arguments as QuranCircleModel? ??
            QuranCircleModel.dummyList()[0];
        return QuranHomeScreen(quranCircle: quranCircle).wrapper;
      default:
        return const NoRoute().wrapper;
    }
  }
}
