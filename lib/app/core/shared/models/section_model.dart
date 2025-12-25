import 'package:fotowah_cmf/app/core/shared/models/member_model.dart';

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

  Map<String, dynamic> toJson() => {
    SectionFields.id: id,
    SectionFields.name: name,
    SectionFields.sectionManagerId: sectionManagerId,
  };

  final String id;
  final String name;
  final String? sectionManagerId;
  final MemberModel? sectionManager;
}
