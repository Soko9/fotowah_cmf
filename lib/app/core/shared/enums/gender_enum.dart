enum Gender {
  male,
  female;

  String get name => switch (this) {
    Gender.male => 'ذكر',
    Gender.female => 'أنثى',
  };

  String get text => switch (this) {
    Gender.male => 'male',
    Gender.female => 'female',
  };
}
