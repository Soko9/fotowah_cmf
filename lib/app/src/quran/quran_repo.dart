import 'package:fotowah_cmf/app/core/resources/app_either.dart';
import 'package:fotowah_cmf/app/core/resources/app_failure.dart';
import 'package:fotowah_cmf/app/core/shared/services/dummy_service.dart';
import 'package:fotowah_cmf/app/src/quran/models/quran_circle_model.dart';

class QuranRepo {
  const QuranRepo(this._dummyService);
  final DummyService _dummyService;

  Future<AppEither<AppFailure, List<QuranCircleModel>>>
  getQuranCircles() async {
    try {
      final data = await _dummyService.getQuranCirclesLookup();
      final circlesData = data['quran_circles'] as List<dynamic>;
      final circles = circlesData
          .map((e) => QuranCircleModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(circles);
    } catch (e, st) {
      return Left(AppFailure(message: e.toString(), stackTrace: st));
    }
  }

  Future<AppEither<AppFailure, QuranCircleModel>> getSections(String id) async {
    try {
      final data = await _dummyService.getQuranCircles(id);
      final circle = QuranCircleModel.fromJson(data);
      return Right(circle);
    } catch (e, st) {
      return Left(AppFailure(message: e.toString(), stackTrace: st));
    }
  }
}
