import 'package:fotowah_cmf/app/core/resources/app_either.dart';
import 'package:fotowah_cmf/app/core/resources/app_failure.dart';
import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';
import 'package:fotowah_cmf/app/core/shared/services/dummy_service.dart';

class HomeRepo {
  const HomeRepo(this._dummyService);
  final DummyService _dummyService;

  Future<AppEither<AppFailure, List<SectionModel>>> getSections() async {
    try {
      final data = await _dummyService.getSections();
      final sectionsData = data['sections'] as List<dynamic>;
      final sections = sectionsData
          .map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(sections);
    } on Exception catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
