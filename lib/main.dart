import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fotowah_cmf/app/core/navigation/app_pages.dart';
import 'package:fotowah_cmf/app/core/theme/app_theme.dart';
import 'package:fotowah_cmf/app/src/home/home_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const System());
}

class System extends StatelessWidget {
  const System({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fotowah CMF',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.light,
      initialRoute: HomeView.route,
      unknownRoute: AppPages.noPage,
      getPages: AppPages.pages,
    );
  }
}
