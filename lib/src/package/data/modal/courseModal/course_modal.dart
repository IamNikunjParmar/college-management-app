import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_modal.g.dart';

@JsonSerializable()
class CourseModal extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String courseName;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  const CourseModal({
    required this.id,
    required this.courseName,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CourseModal.fromJson(Map<String, dynamic> json) => _$CourseModalFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModalToJson(this);

  @override
  List<Object?> get props => [
        id,
        courseName,
        status,
        createdAt,
        updatedAt,
        v,
      ];

  CourseModal copyWith(
      {String? id, String? courseName, int? status, DateTime? createdAt, DateTime? updatedAt, int? v}) {
    return CourseModal(
      id: id ?? this.id,
      courseName: courseName ?? this.courseName,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }
}
