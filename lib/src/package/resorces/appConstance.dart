abstract interface class AppConstants {
  static final emailPatternRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final passwordPatternRegExp =
      RegExp(r'^.*(?=.{8,255})((?=.*[!@#$%^&*_,]))(?=.*\d)((?=.*[A-Z]))((?=.*[a-z])).*$');

  static final namePatternRegExp = RegExp(r'^[a-zA-Z ]{3,60}$');
  static final numberRegExp = RegExp(r'^[0-9]{4}$');
  static final amountRegExp = RegExp(r'^[0-9]+(\.[0-9][0-9])?$');

  static const baseUrl = 'https://e387-115-242-148-218.ngrok-free.app';
}
