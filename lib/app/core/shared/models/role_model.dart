import 'package:fotowah_cmf/app/core/shared/models/permission_model.dart';

class RoleFields {
  const RoleFields._();

  static const id = 'id';
  static const name = 'name';
  static const permissions = 'permissions';
}

//region Many-To-Many
// final response = await supabase
//     .from('role')
// .select('*, ${RoleFields.permissions}:permission(*)'); // Select all permission and their roles
//endregion

class RoleModel {
  const RoleModel({
    required this.id,
    required this.name,
    this.permissions = const [],
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
    id: json[RoleFields.id] as String,
    name: json[RoleFields.name] as String,
    permissions:
        (json[RoleFields.permissions] as List<dynamic>?)
            ?.map((p) => PermissionModel.fromJson(p as Map<String, dynamic>))
            .toList() ??
        [],
  );

  Map<String, dynamic> toJson() => {
    RoleFields.id: id,
    RoleFields.name: name,
  };

  final String id;
  final String name;
  final List<PermissionModel> permissions;
}
