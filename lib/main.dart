import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/navigation/app_routes.dart';
import 'package:fotowah_cmf/app/core/theme/app_theme.dart';
import 'package:fotowah_cmf/app/src/home/home_screen.dart';

void main() {
  runApp(const System());
}

class System extends StatelessWidget {
  const System({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fotowah CMF',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: HomeScreen.route,
      onGenerateRoute: AppRoutes.appRoutes,
    );
  }
}
