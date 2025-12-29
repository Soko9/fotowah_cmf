import 'package:fotowah_cmf/app/core/shared/models/member_model.dart';
import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';
import 'package:fotowah_cmf/app/src/quran/models/gathering_date_model.dart';

class QurnCircleFields {
  const QurnCircleFields._();

  static const id = 'id';
  static const name = 'name';
  static const quranCircleManagerId = 'quran_circle_manager_id';
  static const quranCircleManager = 'quran_circle_manager';
  static const sectionId = 'section_id';
  static const section = 'section';
  static const weeklyGatherings = 'weekly_gatherings';
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
    weeklyGatherings:
        (json[QurnCircleFields.weeklyGatherings] as List<dynamic>?)
            ?.map((e) => GatheringDateModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    members:
        (json[QurnCircleFields.members] as List<dynamic>?)
            ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );

  Map<String, dynamic> toJson() => {
    QurnCircleFields.id: id,
    QurnCircleFields.name: name,
    QurnCircleFields.quranCircleManagerId: quranCircleManagerId,
    QurnCircleFields.sectionId: sectionId,
  };

  static List<QuranCircleModel> dummyList() => [
    QuranCircleModel(
      id: '1',
      name: 'ابو بكر الصديق',
      quranCircleManagerId: MemberModel.dummy().id,
      quranCircleManager: MemberModel.dummy(),
      sectionId: SectionModel.dummyList()[0].id,
      section: SectionModel.dummyList()[0],
      weeklyGatherings: GatheringDateModel.dummyList(),
      members: [
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
      ],
    ),
    QuranCircleModel(
      id: '1',
      name: 'عمر ابن الخطاب',
      quranCircleManagerId: MemberModel.dummy().id,
      quranCircleManager: MemberModel.dummy(),
      sectionId: SectionModel.dummyList()[0].id,
      section: SectionModel.dummyList()[0],
      weeklyGatherings: GatheringDateModel.dummyList(),
      members: [
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
      ],
    ),
    QuranCircleModel(
      id: '1',
      name: 'عثمان ابن عفان',
      quranCircleManagerId: MemberModel.dummy().id,
      quranCircleManager: MemberModel.dummy(),
      sectionId: SectionModel.dummyList()[0].id,
      section: SectionModel.dummyList()[0],
      weeklyGatherings: GatheringDateModel.dummyList(),
      members: [
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
      ],
    ),
    QuranCircleModel(
      id: '1',
      name: 'علي ابن ابي طالب',
      quranCircleManagerId: MemberModel.dummy().id,
      quranCircleManager: MemberModel.dummy(),
      sectionId: SectionModel.dummyList()[0].id,
      section: SectionModel.dummyList()[0],
      weeklyGatherings: GatheringDateModel.dummyList(),
      members: [
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
      ],
    ),
    QuranCircleModel(
      id: '1',
      name: 'سعد ابن ابي وقاص',
      quranCircleManagerId: MemberModel.dummy().id,
      quranCircleManager: MemberModel.dummy(),
      sectionId: SectionModel.dummyList()[0].id,
      section: SectionModel.dummyList()[0],
      weeklyGatherings: GatheringDateModel.dummyList(),
      members: [
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
      ],
    ),
    QuranCircleModel(
      id: '1',
      name: 'طلحة ابن عبيد الله',
      quranCircleManagerId: MemberModel.dummy().id,
      quranCircleManager: MemberModel.dummy(),
      sectionId: SectionModel.dummyList()[0].id,
      section: SectionModel.dummyList()[0],
      weeklyGatherings: GatheringDateModel.dummyList(),
      members: [
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
      ],
    ),
    QuranCircleModel(
      id: '1',
      name: 'سعيد ابن زيد',
      quranCircleManagerId: MemberModel.dummy().id,
      quranCircleManager: MemberModel.dummy(),
      sectionId: SectionModel.dummyList()[0].id,
      section: SectionModel.dummyList()[0],
      weeklyGatherings: GatheringDateModel.dummyList(),
      members: [
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
      ],
    ),
    QuranCircleModel(
      id: '1',
      name: 'ابو عبيدة ابن الجراح',
      quranCircleManagerId: MemberModel.dummy().id,
      quranCircleManager: MemberModel.dummy(),
      sectionId: SectionModel.dummyList()[0].id,
      section: SectionModel.dummyList()[0],
      weeklyGatherings: GatheringDateModel.dummyList(),
      members: [
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
        MemberModel.dummy(),
      ],
    ),
  ];

  final String id;
  final String name;
  final String? quranCircleManagerId;
  final MemberModel? quranCircleManager;
  final String? sectionId;
  final SectionModel? section;
  final List<GatheringDateModel>? weeklyGatherings;
  final List<MemberModel> members;
}
