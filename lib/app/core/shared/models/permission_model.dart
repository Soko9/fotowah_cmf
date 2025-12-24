class PermissionFields {
  const PermissionFields._();

  static const id = 'id';
  static const name = 'name';
}

class PermissionModel {
  const PermissionModel({
    required this.id,
    required this.name,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      PermissionModel(
        id: json[PermissionFields.id] as String,
        name: json[PermissionFields.name] as String,
      );

  Map<String, dynamic> toJson() => {
    PermissionFields.id: id,
    PermissionFields.name: name,
  };

  final String id;
  final String name;
}
