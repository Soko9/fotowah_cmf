import 'package:fotowah_cmf/app/core/shared/enums/attendance_status_enum.dart';
import 'package:fotowah_cmf/app/core/shared/models/member_model.dart';
import 'package:fotowah_cmf/app/src/quran/models/quran_circle_gathering_model.dart';

class QuranCircleAttendanceFields {
  const QuranCircleAttendanceFields._();

  static const gatheringId = 'gathering_id';
  static const gathering = 'gathering';
  static const memberId = 'member_id';
  static const member = 'member';
  static const status = 'status';
  static const score = 'score';
  static const note = 'note';
  static const quranVersesStart = 'quran_verses_start';
  static const quranVersesEnd = 'quran_verses_end';
  static const quality = 'quality';
}

class QuranCircleAttendanceModel {
  const QuranCircleAttendanceModel({
    required this.gatheringId,
    required this.gathering,
    required this.memberId,
    required this.member,
    required this.status,
    this.score,
    this.note,
    this.quranVersesStart,
    this.quranVersesEnd,
    this.quality,
  });

  factory QuranCircleAttendanceModel.fromJson(
    Map<String, dynamic> json,
  ) => QuranCircleAttendanceModel(
    gatheringId: json[QuranCircleAttendanceFields.gatheringId] as String?,
    gathering:
        (json[QuranCircleAttendanceFields.gathering]
                as Map<String, dynamic>?) !=
            null
        ? QuranCircleGatheringModel.fromJson(
            json[QuranCircleAttendanceFields.gathering] as Map<String, dynamic>,
          )
        : null,
    memberId: json[QuranCircleAttendanceFields.memberId] as String?,
    member:
        (json[QuranCircleAttendanceFields.member] as Map<String, dynamic>?) !=
            null
        ? MemberModel.fromJson(
            json[QuranCircleAttendanceFields.member] as Map<String, dynamic>,
          )
        : null,
    status: AttendanceStatusEnum.fromString(
      json[QuranCircleAttendanceFields.status] as String,
    ),
    score: json[QuranCircleAttendanceFields.score] as int?,
    note: json[QuranCircleAttendanceFields.note] as String?,
    quranVersesStart:
        json[QuranCircleAttendanceFields.quranVersesStart] as int?,
    quranVersesEnd: json[QuranCircleAttendanceFields.quranVersesEnd] as int?,
    quality: (json[QuranCircleAttendanceFields.quality] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    QuranCircleAttendanceFields.gatheringId: gatheringId,
    QuranCircleAttendanceFields.memberId: memberId,
    QuranCircleAttendanceFields.status: status.string,
    QuranCircleAttendanceFields.score: score,
    QuranCircleAttendanceFields.note: note,
    QuranCircleAttendanceFields.quranVersesStart: quranVersesStart,
    QuranCircleAttendanceFields.quranVersesEnd: quranVersesEnd,
    QuranCircleAttendanceFields.quality: quality,
  };

  final String? gatheringId;
  final QuranCircleGatheringModel? gathering;
  final String? memberId;
  final MemberModel? member;
  final AttendanceStatusEnum status;
  final int? score;
  final String? note;
  final int? quranVersesStart;
  final int? quranVersesEnd;
  final List<int>? quality;
}
