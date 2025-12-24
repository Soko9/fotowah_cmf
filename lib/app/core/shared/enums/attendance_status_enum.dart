enum AttendanceStatusEnum {
  absent,
  present,
  excused;

  String get name => switch (this) {
    AttendanceStatusEnum.absent => 'غائب',
    AttendanceStatusEnum.present => 'حاضر',
    AttendanceStatusEnum.excused => 'معذور',
  };

  String get text => switch (this) {
    AttendanceStatusEnum.absent => 'absent',
    AttendanceStatusEnum.present => 'present',
    AttendanceStatusEnum.excused => 'excused',
  };
}
