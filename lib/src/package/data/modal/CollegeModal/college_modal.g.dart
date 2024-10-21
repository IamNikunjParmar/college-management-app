// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'college_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollegeModal _$CollegeModalFromJson(Map<String, dynamic> json) => CollegeModal(
      collegeName: json['collegeName'] as String,
      courseName: json['courseName'] as String,
      openingRank: (json['openingRank'] as num).toInt(),
      closingRank: (json['closingRank'] as num).toInt(),
      collegeId: json['collegeId'] as String?,
    );

Map<String, dynamic> _$CollegeModalToJson(CollegeModal instance) =>
    <String, dynamic>{
      'collegeName': instance.collegeName,
      'collegeId': instance.collegeId,
      'courseName': instance.courseName,
      'openingRank': instance.openingRank,
      'closingRank': instance.closingRank,
    };
