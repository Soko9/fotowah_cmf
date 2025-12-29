enum GenderEnum {
  male,
  female;

  factory GenderEnum.fromString(String genderStr) =>
      GenderEnum.values.singleWhere(
        (g) => g.string.toLowerCase() == genderStr.toLowerCase(),
        orElse: () => GenderEnum.male,
      );

  String get name => switch (this) {
    GenderEnum.male => 'ذكر',
    GenderEnum.female => 'أنثى',
  };

  String get string => switch (this) {
    GenderEnum.male => 'male',
    GenderEnum.female => 'female',
  };
}
