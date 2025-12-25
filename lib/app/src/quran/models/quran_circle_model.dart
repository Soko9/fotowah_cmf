import 'package:fotowah_cmf/app/core/shared/models/member_model.dart';
import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';

class QurnCircleFields {
  const QurnCircleFields._();

  static const id = 'id';
  static const name = 'name';
  static const weeklyGatherings = 'weekly_gatherings';
  static const quranCircleManagerId = 'quran_circle_manager_id';
  static const quranCircleManager = 'quran_circle_manager';
  static const sectionId = 'section_id';
  static const section = 'section';
  static const members = 'members';
}

// region One-To-Many
// final response = await supabase
//     .from('quran_circle')
// .select('*, ${QurnCircleFields.quranCircleManager}: member(*)')
// .select('*, ${QurnCircleFields.section}: section(*)');
//endregion

//region Many-To-Many
// final response = await supabase
//     .from('member')
// .select('*, ${QurnCircleFields.members}:member(*)');
//endregion

class QuranCircleModel {
  const QuranCircleModel({
    required this.id,
    required this.name,
    this.weeklyGatherings,
    this.quranCircleManagerId,
    this.quranCircleManager,
    this.sectionId,
    this.section,
    this.members = const [],
  });

  factory QuranCircleModel.fromJson(
    Map<String, dynamic> json,
  ) => QuranCircleModel(
    id: json[QurnCircleFields.id] as String,
    name: json[QurnCircleFields.name] as String,
    weeklyGatherings:
        (json[QurnCircleFields.weeklyGatherings] as List<dynamic>?)
            ?.map((e) => DateTime.parse(e as String))
            .toList() ??
        [],
    quranCircleManagerId:
        json[QurnCircleFields.quranCircleManagerId] as String?,
    quranCircleManager:
        (json[QurnCircleFields.quranCircleManager] as Map<String, dynamic>?) !=
            null
        ? MemberModel.fromJson(
            json[QurnCircleFields.quranCircleManager] as Map<String, dynamic>,
          )
        : null,
    sectionId: json[QurnCircleFields.sectionId] as String?,
    section: (json[QurnCircleFields.section] as Map<String, dynamic>?) != null
        ? SectionModel.fromJson(
            json[QurnCircleFields.section] as Map<String, dynamic>,
          )
        : null,
    members:
        (json[QurnCircleFields.members] as List<dynamic>?)
            ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );

  Map<String, dynamic> toJson() => {
    QurnCircleFields.id: id,
    QurnCircleFields.name: name,
    QurnCircleFields.weeklyGatherings: weeklyGatherings
        ?.map((e) => e.toIso8601String())
        .toList(),
    QurnCircleFields.quranCircleManagerId: quranCircleManagerId,
    QurnCircleFields.sectionId: sectionId,
  };

  final String id;
  final String name;
  final List<DateTime>? weeklyGatherings;
  final String? quranCircleManagerId;
  final MemberModel? quranCircleManager;
  final String? sectionId;
  final SectionModel? section;
  final List<MemberModel> members;
}
