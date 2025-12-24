enum AttendanceStatusEnum {
  absent,
  present,
  excused;

  factory AttendanceStatusEnum.fromString(String statusStr) =>
      AttendanceStatusEnum.values.singleWhere(
        (as) => as.string.toLowerCase() == statusStr.toLowerCase(),
        orElse: () => AttendanceStatusEnum.absent,
      );

  String get name => switch (this) {
    AttendanceStatusEnum.absent => 'غائب',
    AttendanceStatusEnum.present => 'حاضر',
    AttendanceStatusEnum.excused => 'معذور',
  };

  String get string => switch (this) {
    AttendanceStatusEnum.absent => 'absent',
    AttendanceStatusEnum.present => 'present',
    AttendanceStatusEnum.excused => 'excused',
  };
}
