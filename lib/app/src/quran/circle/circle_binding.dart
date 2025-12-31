import 'package:fotowah_cmf/app/core/shared/services/dummy_service.dart';
import 'package:fotowah_cmf/app/src/quran/circle/circle_controller.dart';
import 'package:fotowah_cmf/app/src/quran/quran_repo.dart';
import 'package:get/get.dart';

class CircleBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<QuranRepo>(() => QuranRepo(Get.find<DummyService>()))
      ..lazyPut<CircleController>(
        () => CircleController(Get.find<QuranRepo>()),
      );
  }
}
