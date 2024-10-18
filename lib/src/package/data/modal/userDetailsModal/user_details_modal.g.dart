// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsModal _$UserDetailsModalFromJson(Map<String, dynamic> json) =>
    UserDetailsModal(
      id: json['_id'] as String?,
      studentName: json['studentName'] as String?,
      courseName: json['courseName'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      dateOfBirth: json['dateOfbirth'] as String?,
      gender: json['gender'] as String?,
      phoneNo: (json['phoneNo'] as num?)?.toInt(),
      cast: json['cast'] as String?,
      fatherName: json['fatherName'] as String?,
      motherName: json['motherName'] as String?,
      address: json['address'] as String?,
      pinCode: (json['pinCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserDetailsModalToJson(UserDetailsModal instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'studentName': instance.studentName,
      'courseName': instance.courseName,
      'city': instance.city,
      'country': instance.country,
      'dateOfbirth': instance.dateOfBirth,
      'gender': instance.gender,
      'phoneNo': instance.phoneNo,
      'cast': instance.cast,
      'fatherName': instance.fatherName,
      'motherName': instance.motherName,
      'address': instance.address,
      'pinCode': instance.pinCode,
    };
