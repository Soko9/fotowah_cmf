import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/navigation/app_routes.dart';
import 'package:fotowah_cmf/app/core/theme/app_theme.dart';
import 'package:fotowah_cmf/app/src/home/home_screen.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  const windowOptions = WindowOptions(
    center: true,
    fullScreen: true,
    titleBarStyle: TitleBarStyle.hidden,
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const System());
}

class System extends StatelessWidget {
  const System({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        title: 'Fotowah CMF',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        initialRoute: HomeScreen.route,
        onGenerateRoute: AppRoutes.appRoutes,
      ),
    );
  }
}
