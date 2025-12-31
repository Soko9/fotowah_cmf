enum SectionEnum {
  quran,
  women,
  scouts,
  academy,
  relations,
  daawah,
  social,
  sports;

  factory SectionEnum.fromString(String sectionStr) =>
      SectionEnum.values.singleWhere(
        (r) => r.string.toLowerCase() == sectionStr.toLowerCase(),
        orElse: () => SectionEnum.quran,
      );

  String get string => switch (this) {
    SectionEnum.quran => 'quran',
    SectionEnum.women => 'women',
    SectionEnum.sports => 'sports',
    SectionEnum.social => 'social',
    SectionEnum.academy => 'academy',
    SectionEnum.relations => 'relations',
    SectionEnum.scouts => 'scouts',
    SectionEnum.daawah => 'daawah',
  };
}
