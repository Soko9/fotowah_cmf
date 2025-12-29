import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/string_extensions.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/time_extensions.dart';

class GatheringDateFields {
  const GatheringDateFields._();

  static const id = 'id';
  static const weekday = 'weekday';
  static const timeOfDay = 'time_of_day';
}

class GatheringDateModel {
  const GatheringDateModel({
    required this.id,
    required this.weekday,
    required this.timeOfDay,
  });

  factory GatheringDateModel.fromJson(Map<String, dynamic> json) =>
      GatheringDateModel(
        id: json[GatheringDateFields.id] as int,
        weekday: json[GatheringDateFields.weekday] as String,
        timeOfDay: (json[GatheringDateFields.timeOfDay] as String).time,
      );

  Map<String, dynamic> toJson() => {
    GatheringDateFields.id: id,
    GatheringDateFields.weekday: weekday,
    GatheringDateFields.timeOfDay: timeOfDay.time,
  };

  static List<GatheringDateModel> dummyList() => const [
    GatheringDateModel(
      id: 1,
      weekday: 'الأربعاء',
      timeOfDay: TimeOfDay(hour: 14, minute: 30),
    ),
    GatheringDateModel(
      id: 2,
      weekday: 'السبت',
      timeOfDay: TimeOfDay(hour: 11, minute: 00),
    ),
  ];

  final int id;
  final String weekday;
  final TimeOfDay timeOfDay;
}
