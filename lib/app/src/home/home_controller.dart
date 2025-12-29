import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';
import 'package:fotowah_cmf/app/src/home/home_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this._homeRepo);
  final HomeRepo _homeRepo;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;
  set errorMessage(String value) => _errorMessage.value = value;

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
          errorMessage = failure.message;
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
