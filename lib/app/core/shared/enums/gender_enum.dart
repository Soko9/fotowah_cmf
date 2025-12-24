enum Gender {
  male,
  female;

  factory Gender.fromString(String genderStr) => Gender.values.singleWhere(
    (g) => g.string.toLowerCase() == genderStr.toLowerCase(),
    orElse: () => Gender.male,
  );

  String get name => switch (this) {
    Gender.male => 'ذكر',
    Gender.female => 'أنثى',
  };

  String get string => switch (this) {
    Gender.male => 'male',
    Gender.female => 'female',
  };
}
