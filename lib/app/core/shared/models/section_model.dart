import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/models/member_model.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';

class SectionFields {
  const SectionFields._();

  static const id = 'id';
  static const name = 'name';
  static const sectionManagerId = 'section_manager_id';
  static const sectionManager = 'section_manager';
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
    this.color,
    this.icon,
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
  );

  static List<SectionModel> dummyList() => [
    SectionModel(
      id: '1',
      name: 'حلقات القرآن',
      sectionManagerId: MemberModel.dummy().id,
      sectionManager: MemberModel.dummy(),
      color: AppColors.quran,
      icon: Icons.insert_photo_rounded,
    ),
    SectionModel(
      id: '2',
      name: 'رائدات',
      sectionManagerId: MemberModel.dummy().id,
      sectionManager: MemberModel.dummy(),
      color: AppColors.women,
      icon: Icons.insert_photo_rounded,
    ),
    SectionModel(
      id: '3',
      name: 'الاكاديمية',
      sectionManagerId: MemberModel.dummy().id,
      sectionManager: MemberModel.dummy(),
      color: AppColors.academy,
      icon: Icons.insert_photo_rounded,
    ),
    SectionModel(
      id: '4',
      name: 'الكشافة',
      sectionManagerId: MemberModel.dummy().id,
      sectionManager: MemberModel.dummy(),
      color: AppColors.scouts,
      icon: Icons.insert_photo_rounded,
    ),
    SectionModel(
      id: '5',
      name: 'القسم الدعوي',
      sectionManagerId: MemberModel.dummy().id,
      sectionManager: MemberModel.dummy(),
      color: AppColors.daawah,
      icon: Icons.insert_photo_rounded,
    ),
    SectionModel(
      id: '6',
      name: 'القسم الرياضي',
      sectionManagerId: MemberModel.dummy().id,
      sectionManager: MemberModel.dummy(),
      color: AppColors.sports,
      icon: Icons.insert_photo_rounded,
    ),
    SectionModel(
      id: '7',
      name: 'القسم الاجتماعي',
      sectionManagerId: MemberModel.dummy().id,
      sectionManager: MemberModel.dummy(),
      color: AppColors.social,
      icon: Icons.insert_photo_rounded,
    ),
    SectionModel(
      id: '8',
      name: 'العلاقات العامة',
      sectionManagerId: MemberModel.dummy().id,
      sectionManager: MemberModel.dummy(),
      color: AppColors.relations,
      icon: Icons.insert_photo_rounded,
    ),
  ];

  Map<String, dynamic> toJson() => {
    SectionFields.id: id,
    SectionFields.name: name,
    SectionFields.sectionManagerId: sectionManagerId,
  };

  final String id;
  final String name;
  final String? sectionManagerId;
  final MemberModel? sectionManager;
  final Color? color;
  final IconData? icon;
}
