import 'package:fotowah_cmf/app/core/shared/models/base/base_getx_controller.dart';
import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';
import 'package:fotowah_cmf/app/src/home/home_repo.dart';
import 'package:get/get.dart';

class HomeController extends BaseGetxController {
  HomeController(this._homeRepo);
  final HomeRepo _homeRepo;

  final RxList<SectionModel> _sections = <SectionModel>[].obs;
  List<SectionModel> get sections => _sections;
  set sections(List<SectionModel> value) => _sections.value = value;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _loadSections();
  }

  Future<void> _loadSections() async {
    try {
      isLoading = true;
      errorMessage = '';

      final either = await _homeRepo.getSections();
      either.fold(
        (failure) {
          errorMessage = failure.toString();
        },
        (result) {
          sections = result;
        },
      );
    } on Exception catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
