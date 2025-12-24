import 'package:fotowah_cmf/app/core/shared/enums/gender_enum.dart';
import 'package:fotowah_cmf/app/core/shared/models/address_model.dart';
import 'package:fotowah_cmf/app/core/shared/models/role_model.dart';

class MemberFields {
  const MemberFields._();

  static const id = 'id';
  static const fullName = 'full_name';
  static const gender = 'gender';
  static const dateOfBirth = 'date_of_birth';
  static const phone = 'phone';
  static const addressId = 'address_id';
  static const address = 'address';
  static const nationality = 'nationality';
  static const joinedAt = 'joined_at';
  static const isActive = 'is_active';
  static const roles = 'roles';
}

// region One-To-Many
// final response = await supabase
//     .from('member')
// .select('*, address(*)'); // Select all member fields AND all address fields
//endregion

//region Many-To-Many
// final response = await supabase
//     .from('member')
// .select('*, ${MemberFields.roles}:role(*)'); // Select all members and their roles
//endregion

class MemberModel {
  const MemberModel({
    required this.id,
    required this.fullName,
    required this.gender,
    required this.joinedAt,
    required this.isActive,
    this.dateOfBirth,
    this.phone,
    this.addressId,
    this.address,
    this.nationality,
    this.roles = const [],
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
    id: json[MemberFields.id] as String,
    fullName: json[MemberFields.fullName] as String,
    gender: Gender.fromString(json[MemberFields.gender] as String),
    joinedAt: DateTime.parse(json[MemberFields.joinedAt] as String),
    isActive: json[MemberFields.isActive] as bool,
    dateOfBirth: (json[MemberFields.dateOfBirth] as String?) != null
        ? DateTime.parse(json[MemberFields.dateOfBirth] as String)
        : null,
    phone: json[MemberFields.phone] as String?,
    nationality: json[MemberFields.nationality] as String?,
    addressId: json[MemberFields.addressId] as String?,
    address: (json[MemberFields.address] as Map<String, dynamic>?) != null
        ? AddressModel.fromJson(
            json[MemberFields.address] as Map<String, dynamic>,
          )
        : null,
    roles:
        (json[MemberFields.roles] as List<dynamic>?)
            ?.map((r) => RoleModel.fromJson(r as Map<String, dynamic>))
            .toList() ??
        [],
  );

  Map<String, dynamic> toJson() => {
    MemberFields.id: id,
    MemberFields.fullName: fullName,
    MemberFields.gender: gender.string,
    MemberFields.dateOfBirth: dateOfBirth?.toIso8601String(),
    MemberFields.phone: phone,
    MemberFields.addressId: addressId,
    MemberFields.nationality: nationality,
    MemberFields.joinedAt: joinedAt.toIso8601String(),
    MemberFields.isActive: isActive,
  };

  final String id;
  final String fullName;
  final Gender gender;
  final DateTime? dateOfBirth;
  final String? phone;
  final String? addressId;
  final AddressModel? address;
  final String? nationality;
  final DateTime joinedAt;
  final bool isActive;
  final List<RoleModel> roles;
}
