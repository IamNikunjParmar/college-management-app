// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModal _$UserModalFromJson(Map<String, dynamic> json) => UserModal(
      alternatePhoneNo: (json['alternatePhoneNo'] as num?)?.toInt(),
      studentName: json['studentName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String?,
      phoneNo: (json['phoneNo'] as num).toInt(),
      courseName: json['courseName'] as String,
      meritRank: (json['meritRank'] as num).toInt(),
      fatherName: json['fatherName'] as String,
      motherName: json['motherName'] as String,
      cast: json['cast'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      address: json['address'] as String,
      pinCode: (json['pinCode'] as num).toInt(),
      familyAnnualIncome: json['familyAnnualIncome'] as String,
      physicallyHandicapped: json['physicallyHandicapped'] as String,
      gender: json['gender'] as String,
      dateOfBirth: json['dateOfbirth'] as String,
    );

Map<String, dynamic> _$UserModalToJson(UserModal instance) => <String, dynamic>{
      'studentName': instance.studentName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'phoneNo': instance.phoneNo,
      'courseName': instance.courseName,
      'meritRank': instance.meritRank,
      'pinCode': instance.pinCode,
      'fatherName': instance.fatherName,
      'motherName': instance.motherName,
      'address': instance.address,
      'country': instance.country,
      'city': instance.city,
      'gender': instance.gender,
      'physicallyHandicapped': instance.physicallyHandicapped,
      'cast': instance.cast,
      'dateOfbirth': instance.dateOfBirth,
      'familyAnnualIncome': instance.familyAnnualIncome,
      'alternatePhoneNo': instance.alternatePhoneNo,
    };
