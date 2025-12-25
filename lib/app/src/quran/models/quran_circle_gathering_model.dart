import 'package:fotowah_cmf/app/src/quran/models/quran_circle_model.dart';

class QurnCircleGatheringFields {
  const QurnCircleGatheringFields._();

  static const id = 'id';
  static const datetime = 'datetime';
  static const place = 'place';
  static const quranCircleId = 'quran_circle_id';
  static const quranCircle = 'quran_circle';
}

class QuranCircleGatheringModel {
  const QuranCircleGatheringModel({
    required this.id,
    required this.datetime,
    required this.place,
    this.quranCircleId,
    this.quranCircle,
  });

  factory QuranCircleGatheringModel.fromJson(
    Map<String, dynamic> json,
  ) => QuranCircleGatheringModel(
    id: json[QurnCircleGatheringFields.id] as String,
    datetime: DateTime.parse(
      json[QurnCircleGatheringFields.datetime] as String,
    ),
    place: json[QurnCircleGatheringFields.place] as String,
    quranCircleId: json[QurnCircleGatheringFields.quranCircleId] as String?,
    quranCircle:
        (json[QurnCircleGatheringFields.quranCircle]
                as Map<String, dynamic>?) !=
            null
        ? QuranCircleModel.fromJson(
            json[QurnCircleGatheringFields.quranCircle] as Map<String, dynamic>,
          )
        : null,
  );

  Map<String, dynamic> toJson() => {
    QurnCircleGatheringFields.id: id,
    QurnCircleGatheringFields.datetime: datetime.toIso8601String(),
    QurnCircleGatheringFields.place: place,
    QurnCircleGatheringFields.quranCircleId: quranCircleId,
  };

  final String id;
  final DateTime datetime;
  final String place;
  final String? quranCircleId;
  final QuranCircleModel? quranCircle;
}
