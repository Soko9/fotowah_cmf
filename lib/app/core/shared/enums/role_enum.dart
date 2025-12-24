enum Role {
  admin,
  sectionManager,
  quranCircleManager,
  staff,
  kid,
  guardian,
  needy,
  supporter;

  String get text => switch (this) {
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
