import 'package:fotowah_cmf/app/core/shared/models/base/base_getx_controller.dart';
import 'package:fotowah_cmf/app/src/quran/models/quran_circle_model.dart';
import 'package:fotowah_cmf/app/src/quran/quran_repo.dart';
import 'package:get/get.dart';

class QuranController extends BaseGetxController {
  QuranController(this._quranRepo);
  final QuranRepo _quranRepo;

  final RxList<QuranCircleModel> _circles = <QuranCircleModel>[].obs;
  List<QuranCircleModel> get circles => _circles;
  set circles(List<QuranCircleModel> value) => _circles.value = value;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _loadCircles();
  }

  Future<void> _loadCircles() async {
    try {
      isLoading = true;
      errorMessage = '';

      final either = await _quranRepo.getQuranCircles();
      either.fold(
        (failure) {
          errorMessage = failure.toString();
        },
        (result) {
          circles = result;
        },
      );
    } on Exception catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
