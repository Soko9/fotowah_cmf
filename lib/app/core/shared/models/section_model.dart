import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/managers/assets_manager.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/string_extensions.dart';
import 'package:fotowah_cmf/app/core/shared/models/member_model.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';

class SectionFields {
  const SectionFields._();

  static const id = 'id';
  static const name = 'name';
  static const sectionManagerId = 'section_manager_id';
  static const sectionManager = 'section_manager';
  static const sectionColor = 'section_color';
  static const sectionLogo = 'section_logo';
}

//region One-To-Many
// final response = await supabase
//     .from('section')
// .select('*, ${SectionFields.sectionManager}:member(*)'); // Select all section fields AND all member fields
//endregion

class SectionModel {
  const SectionModel({
    required this.id,
    required this.name,
    this.sectionManagerId,
    this.sectionManager,
    this.sectionColor = Colors.grey,
    this.sectionLogo,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
    id: json[SectionFields.id] as String,
    name: json[SectionFields.name] as String,
    sectionManagerId: json[SectionFields.sectionManagerId] as String?,
    sectionManager:
        (json[SectionFields.sectionManager] as Map<String, dynamic>?) != null
        ? MemberModel.fromJson(
            json[SectionFields.sectionManager] as Map<String, dynamic>,
          )
        : null,
    sectionColor: (json[SectionFields.sectionColor] as String?) != null
        ? (json[SectionFields.sectionColor] as String).fromHex
        : Colors.grey,
    sectionLogo: json[SectionFields.sectionLogo] as String?,
  );

  Map<String, dynamic> toJson() => {
    SectionFields.id: id,
    SectionFields.name: name,
    SectionFields.sectionManagerId: sectionManagerId,
  };

  static List<SectionModel> dummyList() => [
    SectionModel(
      id: '1',
      name: 'حلقات القرآن',
      sectionColor: AppColors.quran,
      sectionLogo: AssetsManager.logoSvg,
      sectionManager: MemberModel.dummy(),
      sectionManagerId: MemberModel.dummy().id,
    ),
    SectionModel(
      id: '2',
      name: 'الأكاديمية',
      sectionColor: AppColors.academy,
      sectionLogo: AssetsManager.logoSvg,
      sectionManager: MemberModel.dummy(),
      sectionManagerId: MemberModel.dummy().id,
    ),
    SectionModel(
      id: '3',
      name: 'رائدات',
      sectionColor: AppColors.women,
      sectionLogo: AssetsManager.logoSvg,
      sectionManager: MemberModel.dummy(),
      sectionManagerId: MemberModel.dummy().id,
    ),
    SectionModel(
      id: '4',
      name: 'الكشافة',
      sectionColor: AppColors.scouts,
      sectionLogo: AssetsManager.logoSvg,
      sectionManager: MemberModel.dummy(),
      sectionManagerId: MemberModel.dummy().id,
    ),
    SectionModel(
      id: '5',
      name: 'القسم الاجتماعي',
      sectionColor: AppColors.social,
      sectionLogo: AssetsManager.logoSvg,
      sectionManager: MemberModel.dummy(),
      sectionManagerId: MemberModel.dummy().id,
    ),
    SectionModel(
      id: '6',
      name: 'القسم الرياضي',
      sectionColor: AppColors.sports,
      sectionLogo: AssetsManager.logoSvg,
      sectionManager: MemberModel.dummy(),
      sectionManagerId: MemberModel.dummy().id,
    ),
    SectionModel(
      id: '7',
      name: 'القسم الدعوي',
      sectionColor: AppColors.daawah,
      sectionLogo: AssetsManager.logoSvg,
      sectionManager: MemberModel.dummy(),
      sectionManagerId: MemberModel.dummy().id,
    ),
    SectionModel(
      id: '8',
      name: 'قسم العلاقات العامة',
      sectionColor: AppColors.relations,
      sectionLogo: AssetsManager.logoSvg,
      sectionManager: MemberModel.dummy(),
      sectionManagerId: MemberModel.dummy().id,
    ),
  ];

  final String id;
  final String name;
  final String? sectionManagerId;
  final MemberModel? sectionManager;
  final Color sectionColor;
  final String? sectionLogo;
}
