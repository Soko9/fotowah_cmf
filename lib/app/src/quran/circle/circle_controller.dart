import 'package:fotowah_cmf/app/core/shared/models/base/base_getx_controller.dart';
import 'package:fotowah_cmf/app/src/quran/models/quran_circle_model.dart';
import 'package:fotowah_cmf/app/src/quran/quran_repo.dart';
import 'package:get/get.dart';

class CircleController extends BaseGetxController {
  CircleController(this._quranRepo);
  final QuranRepo _quranRepo;

  final Rxn<QuranCircleModel> _quranCircle = Rxn();
  QuranCircleModel? get quranCircle => _quranCircle.value;
  set quranCircle(QuranCircleModel? value) => _quranCircle.value = value;

  @override
  Future<void> onInit() async {
    super.onInit();
    final args = Get.arguments as QuranCircleModel;
    quranCircle = args;
    await _getQuranCircle(quranCircle!.id);
  }

  Future<void> _getQuranCircle(String id) async {
    isLoading = true;
    errorMessage = '';
    final either = await _quranRepo.getSections(id);
    either.fold(
      (failure) {
        errorMessage = failure.toString();
      },
      (result) {
        quranCircle = result;
      },
    );
    isLoading = false;
  }
}
