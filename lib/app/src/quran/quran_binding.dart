import 'package:fotowah_cmf/app/core/shared/services/dummy_service.dart';
import 'package:fotowah_cmf/app/src/quran/quran_controller.dart';
import 'package:fotowah_cmf/app/src/quran/quran_repo.dart';
import 'package:get/get.dart';

class QuranBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<QuranRepo>(
        () => QuranRepo(Get.find<DummyService>()),
      )
      ..lazyPut<QuranController>(
        () => QuranController(Get.find<QuranRepo>()),
      );
  }
}
