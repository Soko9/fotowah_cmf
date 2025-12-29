import 'package:fotowah_cmf/app/core/shared/services/dummy_service.dart';
import 'package:fotowah_cmf/app/src/home/home_controller.dart';
import 'package:fotowah_cmf/app/src/home/home_repo.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<DummyService>(DummyService.new)
      ..lazyPut<HomeRepo>(() => HomeRepo(Get.find<DummyService>()))
      ..lazyPut<HomeController>(() => HomeController(Get.find<HomeRepo>()));
  }
}
