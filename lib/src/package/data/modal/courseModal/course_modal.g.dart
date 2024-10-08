// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModal _$CourseModalFromJson(Map<String, dynamic> json) => CourseModal(
      id: json['_id'] as String,
      courseName: json['courseName'] as String,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CourseModalToJson(CourseModal instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'courseName': instance.courseName,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
