import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/enums/section_enum.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/string_extensions.dart';
import 'package:fotowah_cmf/app/core/shared/models/member_model.dart';

class SectionFields {
  const SectionFields._();

  static const id = 'id';
  static const name = 'name';
  static const sectionManagerId = 'section_manager_id';
  static const sectionManager = 'section_manager';
  static const sectionColor = 'section_color';
  static const sectionLogo = 'section_logo';
  static const type = 'type';
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
    this.type,
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
    type: (json[SectionFields.type] as String?) != null
        ? SectionEnum.fromString(json[SectionFields.type] as String)
        : null,
  );

  Map<String, dynamic> toJson() => {
    SectionFields.id: id,
    SectionFields.name: name,
    SectionFields.sectionManagerId: sectionManagerId,
    SectionFields.sectionLogo: sectionLogo,
    SectionFields.type: type?.string,
  };

  final String id;
  final String name;
  final String? sectionManagerId;
  final MemberModel? sectionManager;
  final Color sectionColor;
  final String? sectionLogo;
  final SectionEnum? type;
}
