class AddressFields {
  const AddressFields._();

  static const id = 'id';
  static const city = 'city';
  static const district = 'district';
  static const address = 'address';
}

class AddressModel {
  const AddressModel({
    required this.id,
    required this.city,
    required this.district,
    this.address,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json[AddressFields.id] as String,
    city: json[AddressFields.city] as String,
    district: json[AddressFields.district] as String,
    address: json[AddressFields.address] as String?,
  );

  Map<String, dynamic> toJson() => {
    AddressFields.id: id,
    AddressFields.city: city,
    AddressFields.district: district,
    AddressFields.address: address,
  };

  final String id;
  final String city;
  final String district;
  final String? address;
}
