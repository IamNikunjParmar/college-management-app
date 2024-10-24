import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'college_modal.g.dart';

@JsonSerializable()
class CollegeModal {
  final String collegeName;
  final String? collegeId;
  final String courseName;
  final int openingRank;
  final int closingRank;

  const CollegeModal({
    required this.collegeName,
    required this.courseName,
    required this.openingRank,
    required this.closingRank,
    this.collegeId,
  });

  factory CollegeModal.fromJson(Map<String, dynamic> json) => _$CollegeModalFromJson(json);

  Map<String, dynamic> toJson() => _$CollegeModalToJson(this);

  CollegeModal copyWith({
    String? collegeName,
    String? courseName,
    int? openingRank,
    int? closingRank,
    String? collegeId,
  }) {
    return CollegeModal(
      collegeId: collegeId ?? this.collegeId,
      collegeName: collegeName ?? this.collegeName,
      courseName: courseName ?? this.courseName,
      openingRank: openingRank ?? this.openingRank,
      closingRank: closingRank ?? this.closingRank,
    );
  }
}
