enum Role {
  admin,
  sectionManager,
  quranCircleManager,
  staff,
  kid,
  guardian,
  needy,
  supporter;

  factory Role.fromString(String roleStr) => Role.values.singleWhere(
    (r) => r.string.toLowerCase() == roleStr.toLowerCase(),
    orElse: () => Role.admin,
  );

  String get string => switch (this) {
    Role.admin => 'admin',
    Role.sectionManager => 'section_manager',
    Role.quranCircleManager => 'quran_circle_manager',
    Role.staff => 'staff',
    Role.kid => 'kid',
    Role.guardian => 'guardian',
    Role.needy => 'needy',
    Role.supporter => 'supporter',
  };
}
