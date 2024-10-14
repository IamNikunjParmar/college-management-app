import 'package:json_annotation/json_annotation.dart';

part 'get_course_modal.g.dart';

@JsonSerializable()
class GetCourseModal {
  @JsonKey(name: '_id')
  final String id;
  final String courseName;
  final int? status;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  GetCourseModal({
    required this.id,
    required this.courseName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory GetCourseModal.fromJson(Map<String, dynamic> json) => _$GetCourseModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetCourseModalToJson(this);
}
