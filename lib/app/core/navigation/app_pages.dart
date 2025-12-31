import 'package:fotowah_cmf/app/core/navigation/no_page.dart';
import 'package:fotowah_cmf/app/src/home/home_binding.dart';
import 'package:fotowah_cmf/app/src/home/home_view.dart';
import 'package:fotowah_cmf/app/src/quran/circle/circle_binding.dart';
import 'package:fotowah_cmf/app/src/quran/circle/circle_view.dart';
import 'package:fotowah_cmf/app/src/quran/quran_binding.dart';
import 'package:fotowah_cmf/app/src/quran/quran_view.dart';
import 'package:get/route_manager.dart';

class AppPages {
  const AppPages._();

  static List<GetPage<dynamic>> get pages => [
    GetPage(
      name: HomeView.route,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: QuranView.route,
      page: () => const QuranView(),
      binding: QuranBinding(),
    ),
    GetPage(
      name: CircleView.route,
      page: () => const CircleView(),
      binding: CircleBinding(),
    ),
  ];

  static GetPage<dynamic> get noPage => GetPage(
    name: '/no-page',
    page: () => const NoPage(),
  );
}
