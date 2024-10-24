import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart'; // Import Equatable

part 'get_course_modal.g.dart';

@JsonSerializable()
class GetCourseModal extends Equatable {
  // Extend Equatable
  @JsonKey(name: '_id')
  final String id;
  final String courseName;
  final int? status;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  const GetCourseModal({
    required this.id,
    required this.courseName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory GetCourseModal.fromJson(Map<String, dynamic> json) => _$GetCourseModalFromJson(json);

  Map<String, dynamic> toJson() => _$GetCourseModalToJson(this);

  // Add copyWith method
  GetCourseModal copyWith({
    String? id,
    String? courseName,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return GetCourseModal(
      id: id ?? this.id,
      courseName: courseName ?? this.courseName,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Override props for Equatable
  @override
  List<Object?> get props => [
        id,
        courseName,
        status,
        createdAt,
        updatedAt,
      ];
}
