// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_course_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCourseModal _$GetCourseModalFromJson(Map<String, dynamic> json) =>
    GetCourseModal(
      id: json['_id'] as String,
      courseName: json['courseName'] as String,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$GetCourseModalToJson(GetCourseModal instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'courseName': instance.courseName,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
