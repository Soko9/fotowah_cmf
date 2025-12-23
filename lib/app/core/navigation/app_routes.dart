import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/navigation/no_route.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/widget_extensions.dart';
import 'package:fotowah_cmf/app/src/home/home_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static Route<dynamic> appRoutes(RouteSettings settings) =>
      switch (settings.name) {
        HomeScreen.route => const HomeScreen().wrapper,
        _ => const NoRoute().wrapper,
      };
}
