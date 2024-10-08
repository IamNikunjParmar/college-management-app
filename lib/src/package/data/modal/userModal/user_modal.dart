import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_modal.g.dart';

@JsonSerializable()
class UserModal {
  String studentName;
  String email;
  String password;
  String? confirmPassword;
  int phoneNo;
  String courseName;
  int meritRank;
  int pinCode;
  String fatherName;
  String motherName;
  String address;
  String country;
  String city;
  String gender;
  String physicallyHandicapped;
  String cast;
  @JsonKey(name: 'dateOfbirth')
  String dateOfBirth;
  String familyAnnualIncome;
  String? alternatePhoneNo;

  UserModal({
    this.alternatePhoneNo,
    this.confirmPassword,
    required this.studentName,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.courseName,
    required this.meritRank,
    required this.fatherName,
    required this.motherName,
    required this.cast,
    required this.city,
    required this.country,
    required this.address,
    required this.pinCode,
    required this.familyAnnualIncome,
    required this.physicallyHandicapped,
    required this.gender,
    required this.dateOfBirth,
  });

  factory UserModal.fromJson(Map<String, dynamic> data) => _$UserModalFromJson(data);

  Map<String, dynamic> toJson() => _$UserModalToJson(this);

  @override
  List<Object?> get props => [
        studentName,
        email,
        password,
        confirmPassword,
        phoneNo,
        courseName,
        meritRank,
        fatherName,
        motherName,
        cast,
        city,
        country,
        address,
        pinCode,
        familyAnnualIncome,
        physicallyHandicapped,
        gender,
        dateOfBirth,
        alternatePhoneNo,
      ];

  UserModal copyWith({
    String? studentName,
    String? email,
    String? password,
    String? confirmPassword,
    int? phoneNo,
    String? courseName,
    int? meritRank,
    int? pinCode,
    String? fatherName,
    String? motherName,
    String? address,
    String? country,
    String? city,
    String? gender,
    String? physicallyHandicapped,
    String? cast,
    String? dateOfbirth,
    String? familyAnnualIncome,
    String? alternatePhoneNo,
  }) {
    return UserModal(
      studentName: studentName ?? this.studentName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phoneNo: phoneNo ?? this.phoneNo,
      courseName: courseName ?? this.courseName,
      meritRank: meritRank ?? this.meritRank,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      cast: cast ?? this.cast,
      city: city ?? this.city,
      country: country ?? this.country,
      address: address ?? this.address,
      pinCode: pinCode ?? this.pinCode,
      familyAnnualIncome: familyAnnualIncome ?? this.familyAnnualIncome,
      physicallyHandicapped: physicallyHandicapped ?? this.physicallyHandicapped,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfbirth ?? this.dateOfBirth,
      alternatePhoneNo: alternatePhoneNo ?? this.alternatePhoneNo,
    );
  }
}

/*import 'package:json_annotation/json_annotation.dart';

part 'user_modal.g.dart';

@JsonSerializable()
class UserModal {
  @JsonKey(name: '_id')
  //final String id;
  final String studentName;
  final String email;
  final int phoneNo;
  final String password;
  final String gender;
  final String dateOfbirth;
  final String fatherName;
  final String motherName;
  final String cast;
  final String physicallyHandicapped;
  final String familyAnnualIncome;
  final String address;
  final String city;
  final String country;
  final int pinCode;
  final int? alternatePhoneNo;
  final int meritRank;
  final String courseName;
  final int status;
  final List<Registrationfees>? registrationfees;
  final List<UplodedDocumnets>? uplodedDocumnets;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;
  final int verifyDocument;
  final int authStatus;

  UserModal({
    //required this.id,
    required this.studentName,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.gender,
    required this.dateOfbirth,
    required this.fatherName,
    required this.motherName,
    required this.cast,
    required this.physicallyHandicapped,
    required this.familyAnnualIncome,
    required this.address,
    required this.city,
    required this.country,
    required this.pinCode,
    this.alternatePhoneNo,
    required this.meritRank,
    required this.courseName,
    required this.status,
    this.registrationfees,
    this.uplodedDocumnets,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.verifyDocument,
    required this.authStatus,
  });

  factory UserModal.fromJson(Map<String, dynamic> json) => _$UserModalFromJson(json);

  Map<String, dynamic> toJson() => _$UserModalToJson(this);
}

@JsonSerializable()
class Registrationfees {
  final String transactionNo;
  final int transactionAmount;
  final int paymentStatus;
  @JsonKey(name: '_id')
  final String id;

  Registrationfees({
    required this.transactionNo,
    required this.transactionAmount,
    required this.paymentStatus,
    required this.id,
  });

  factory Registrationfees.fromJson(Map<String, dynamic> json) => _$RegistrationfeesFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationfeesToJson(this);
}

@JsonSerializable()
class UplodedDocumnets {
  final String csatDoc;
  final String studentPhoto;
  final String dobDoc;
  final String diplomaLatestMarksheet;
  final List<Aadharcard> aadharcard;
  @JsonKey(name: '_id')
  final String id;

  UplodedDocumnets({
    required this.csatDoc,
    required this.studentPhoto,
    required this.dobDoc,
    required this.diplomaLatestMarksheet,
    required this.aadharcard,
    required this.id,
  });

  factory UplodedDocumnets.fromJson(Map<String, dynamic> json) => _$UplodedDocumnetsFromJson(json);

  Map<String, dynamic> toJson() => _$UplodedDocumnetsToJson(this);
}

@JsonSerializable()
class Aadharcard {
  final String front;
  final String back;
  @JsonKey(name: '_id')
  final String id;

  Aadharcard({
    required this.front,
    required this.back,
    required this.id,
  });

  factory Aadharcard.fromJson(Map<String, dynamic> json) => _$AadharcardFromJson(json);

  Map<String, dynamic> toJson() => _$AadharcardToJson(this);
}
*/
