abstract interface class AppConstants {
  static final emailPatternRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final passwordPatternRegExp =
      RegExp(r'^.*(?=.{8,255})((?=.*[!@#$%^&*_,]))(?=.*\d)((?=.*[A-Z]))((?=.*[a-z])).*$');
  static final newEmailReg = RegExp(r'^[a-z0-9_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  static final namePatternRegExp = RegExp(r'^[a-zA-Z ]{3,60}$');
  static final numberRegExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
  static final amountRegExp = RegExp(r'^[0-9]+(\.[0-9][0-9])?$');
  static final confirmPasswordRegExp = RegExp(r'^(?!$passwordPatternRegExp$).*$');

  static const baseUrl = 'https://30ec-113-193-210-86.ngrok-free.app';

  //Body data variable
  static const courseName = 'courseName';
}

abstract interface class ApiEndPoints {
  static const studentRegistration = '/studentRegistration';
  static const getAllUser = '/getAllUser';
  static const getAllCourse = "/getCourse";
  static const verifyOtp = "/verifyOTP";
  static const loginUser = "/loginUser";
  static const forgetPasswordOtp = "/forgetpasswordotp";
  static const resetPasswordWithOtp = "/resetPasswordWithOtp";
  static const uploadDocument = "/uploadDocument";
  static const registrationFeePayment = "/registrationfeepayment";
  static const getOneUser = "/getOneUser";
  static const deleteUserAccount = "/deleteUserAccount";
  static const getCourseList = "/getcourselist";
  static const studentSelectCourse = "/studentselectcourse";
  static const updateUser = "/updateUser";
  static const logoutUser = "/logoutuser";
  static const getCollegesForCourse = "/getCollegesForCourse";
  static const studentSelectCollege = "/studentselectCollege";
  static const selectCollegeResult = "/selectcollegeresult";
  static const admissionFeePayment = "/admitionfeepayment";
}
