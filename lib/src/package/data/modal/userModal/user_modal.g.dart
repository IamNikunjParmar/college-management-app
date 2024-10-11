// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModal _$UserModalFromJson(Map<String, dynamic> json) => UserModal(
      alternatePhoneNo: json['alternatePhoneNo'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      studentName: json['studentName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
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
      registrationfees: (json['registrationfees'] as List<dynamic>?)
          ?.map((e) => Registrationfees.fromJson(e as Map<String, dynamic>))
          .toList(),
      uplodedDocumnets: (json['uplodedDocumnets'] as List<dynamic>?)
          ?.map((e) => UplodedDocumnets.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
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
      'status': instance.status,
      'registrationfees': instance.registrationfees,
      'uplodedDocumnets': instance.uplodedDocumnets,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

Registrationfees _$RegistrationfeesFromJson(Map<String, dynamic> json) =>
    Registrationfees(
      transactionNo: json['transactionNo'] as String,
      transactionAmount: (json['transactionAmount'] as num).toInt(),
      paymentStatus: (json['paymentStatus'] as num).toInt(),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$RegistrationfeesToJson(Registrationfees instance) =>
    <String, dynamic>{
      'transactionNo': instance.transactionNo,
      'transactionAmount': instance.transactionAmount,
      'paymentStatus': instance.paymentStatus,
      '_id': instance.id,
    };

UplodedDocumnets _$UplodedDocumnetsFromJson(Map<String, dynamic> json) =>
    UplodedDocumnets(
      csatDoc: json['csatDoc'] as String,
      studentPhoto: json['studentPhoto'] as String,
      dobDoc: json['dobDoc'] as String,
      diplomaLatestMarksheet: json['diplomaLatestMarksheet'] as String,
      aadharcard: (json['aadharcard'] as List<dynamic>)
          .map((e) => Aadharcard.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$UplodedDocumnetsToJson(UplodedDocumnets instance) =>
    <String, dynamic>{
      'csatDoc': instance.csatDoc,
      'studentPhoto': instance.studentPhoto,
      'dobDoc': instance.dobDoc,
      'diplomaLatestMarksheet': instance.diplomaLatestMarksheet,
      'aadharcard': instance.aadharcard,
      '_id': instance.id,
    };

Aadharcard _$AadharcardFromJson(Map<String, dynamic> json) => Aadharcard(
      front: json['front'] as String,
      back: json['back'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$AadharcardToJson(Aadharcard instance) =>
    <String, dynamic>{
      'front': instance.front,
      'back': instance.back,
      '_id': instance.id,
    };
