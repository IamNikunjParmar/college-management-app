import 'package:json_annotation/json_annotation.dart';

part 'user_details_modal.g.dart';

@JsonSerializable()
class UserDetailsModal {
  @JsonKey(name: '_id')
  final String? id;
  final String? studentName;
  final String? courseName;
  final String? city;
  final String? country;
  @JsonKey(name: 'dateOfbirth')
  final String? dateOfBirth;
  final String? gender;
  final int? phoneNo;
  final String? cast;
  final String? fatherName;
  final String? motherName;
  final String? address;
  final int? pinCode;

  UserDetailsModal({
    this.id,
    this.studentName,
    this.courseName,
    this.city,
    this.country,
    this.dateOfBirth,
    this.gender,
    this.phoneNo,
    this.cast,
    this.fatherName,
    this.motherName,
    this.address,
    this.pinCode,
  });

  factory UserDetailsModal.fromJson(Map<String, dynamic> json) => _$UserDetailsModalFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsModalToJson(this);

  UserDetailsModal copyWith({
    String? id,
    String? studentName,
    String? courseName,
    String? city,
    String? country,
    String? dateOfBirth,
    String? gender,
    int? phoneNo,
    String? cast,
    String? fatherName,
    String? motherName,
    String? address,
    int? pinCode,
  }) {
    return UserDetailsModal(
      id: id ?? this.id,
      studentName: studentName ?? this.studentName,
      city: city ?? this.city,
      country: country ?? this.country,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      phoneNo: phoneNo ?? this.phoneNo,
      cast: cast ?? this.cast,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      address: address ?? this.address,
      pinCode: pinCode ?? this.pinCode,
      courseName: courseName ?? this.courseName,
    );
  }
}
