enum RoleEnum {
  admin,
  sectionManager,
  quranCircleManager,
  staff,
  kid,
  guardian,
  needy,
  supporter;

  factory RoleEnum.fromString(String roleStr) => RoleEnum.values.singleWhere(
    (r) => r.string.toLowerCase() == roleStr.toLowerCase(),
    orElse: () => RoleEnum.admin,
  );

  String get string => switch (this) {
    RoleEnum.admin => 'admin',
    RoleEnum.sectionManager => 'section_manager',
    RoleEnum.quranCircleManager => 'quran_circle_manager',
    RoleEnum.staff => 'staff',
    RoleEnum.kid => 'kid',
    RoleEnum.guardian => 'guardian',
    RoleEnum.needy => 'needy',
    RoleEnum.supporter => 'supporter',
  };
}
