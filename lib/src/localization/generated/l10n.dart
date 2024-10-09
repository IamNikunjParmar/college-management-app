// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class CMLocalizations {
  CMLocalizations();

  static CMLocalizations? _current;

  static CMLocalizations get current {
    assert(_current != null,
        'No instance of CMLocalizations was loaded. Try to initialize the CMLocalizations delegate before accessing CMLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<CMLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = CMLocalizations();
      CMLocalizations._current = instance;

      return instance;
    });
  }

  static CMLocalizations of(BuildContext context) {
    final instance = CMLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of CMLocalizations present in the widget tree. Did you add CMLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static CMLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<CMLocalizations>(context, CMLocalizations);
  }

  /// `College Management`
  String get appName {
    return Intl.message(
      'College Management',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Student Registration`
  String get studentRegistration {
    return Intl.message(
      'Student Registration',
      name: 'studentRegistration',
      desc: '',
      args: [],
    );
  }

  /// `General Details`
  String get generalDetails {
    return Intl.message(
      'General Details',
      name: 'generalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Personal Details`
  String get personalDetails {
    return Intl.message(
      'Personal Details',
      name: 'personalDetails',
      desc: '',
      args: [],
    );
  }

  /// `StudentName`
  String get studentName {
    return Intl.message(
      'StudentName',
      name: 'studentName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get enterYourName {
    return Intl.message(
      'Enter Your Name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get enterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Confirm Password`
  String get enterYourConfirmPassword {
    return Intl.message(
      'Enter Your Confirm Password',
      name: 'enterYourConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Mobile Number`
  String get enterYourMobileNumber {
    return Intl.message(
      'Enter Your Mobile Number',
      name: 'enterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Merit Rank`
  String get enterYourMeritRank {
    return Intl.message(
      'Enter Your Merit Rank',
      name: 'enterYourMeritRank',
      desc: '',
      args: [],
    );
  }

  /// `Select Course`
  String get selectCourse {
    return Intl.message(
      'Select Course',
      name: 'selectCourse',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Course Name`
  String get courseName {
    return Intl.message(
      'Course Name',
      name: 'courseName',
      desc: '',
      args: [],
    );
  }

  /// `Merit Rank`
  String get meritRank {
    return Intl.message(
      'Merit Rank',
      name: 'meritRank',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Father\'s Name`
  String get fatherName {
    return Intl.message(
      'Father\\\'s Name',
      name: 'fatherName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your FatherName`
  String get enterYourFatherName {
    return Intl.message(
      'Enter Your FatherName',
      name: 'enterYourFatherName',
      desc: '',
      args: [],
    );
  }

  /// `Mother\'s Name`
  String get motherName {
    return Intl.message(
      'Mother\\\'s Name',
      name: 'motherName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your MotherName`
  String get enterYourMotherName {
    return Intl.message(
      'Enter Your MotherName',
      name: 'enterYourMotherName',
      desc: '',
      args: [],
    );
  }

  /// `Cast`
  String get cast {
    return Intl.message(
      'Cast',
      name: 'cast',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Cast`
  String get enterYourCast {
    return Intl.message(
      'Enter Your Cast',
      name: 'enterYourCast',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your City`
  String get enterYourCity {
    return Intl.message(
      'Enter Your City',
      name: 'enterYourCity',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Country`
  String get enterYourCountry {
    return Intl.message(
      'Enter your Country',
      name: 'enterYourCountry',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your address`
  String get enterYourAddress {
    return Intl.message(
      'Enter Your address',
      name: 'enterYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Pin Code`
  String get pinCode {
    return Intl.message(
      'Pin Code',
      name: 'pinCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter your pin code`
  String get enterYourPinCode {
    return Intl.message(
      'Enter your pin code',
      name: 'enterYourPinCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Annual Income`
  String get enterYourAnnualIncome {
    return Intl.message(
      'Enter your Annual Income',
      name: 'enterYourAnnualIncome',
      desc: '',
      args: [],
    );
  }

  /// `Annual Income`
  String get annualIncome {
    return Intl.message(
      'Annual Income',
      name: 'annualIncome',
      desc: '',
      args: [],
    );
  }

  /// `AlertNate Mobile Number`
  String get alertNateMobileNumber {
    return Intl.message(
      'AlertNate Mobile Number',
      name: 'alertNateMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Mobile Number`
  String get enterYourOptionalNumber {
    return Intl.message(
      'Enter your Mobile Number',
      name: 'enterYourOptionalNumber',
      desc: '',
      args: [],
    );
  }

  /// `Physically Handicapped`
  String get physicallyHandicapped {
    return Intl.message(
      'Physically Handicapped',
      name: 'physicallyHandicapped',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Please enter name!`
  String get errorNameEmpty {
    return Intl.message(
      'Please enter name!',
      name: 'errorNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email address!`
  String get errorEmailAddressEmpty {
    return Intl.message(
      'Please enter email address!',
      name: 'errorEmailAddressEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password!`
  String get errorPasswordEmpty {
    return Intl.message(
      'Please enter password!',
      name: 'errorPasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `• Password length must be within 8-24 characters.`
  String get errorPasswordMinimumLength {
    return Intl.message(
      '• Password length must be within 8-24 characters.',
      name: 'errorPasswordMinimumLength',
      desc: '',
      args: [],
    );
  }

  /// `• Password must contain capital letter, small letter, number & an special character [!,@,#,$,%,^,&,*,_]!`
  String get errorPasswordSupportedCharacters {
    return Intl.message(
      '• Password must contain capital letter, small letter, number & an special character [!,@,#,\$,%,^,&,*,_]!',
      name: 'errorPasswordSupportedCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Please enter confirm password!`
  String get errorConfirmPasswordEmpty {
    return Intl.message(
      'Please enter confirm password!',
      name: 'errorConfirmPasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password must match!`
  String get errorPasswordAndConfirmPasswordNotMatch {
    return Intl.message(
      'Password and confirm password must match!',
      name: 'errorPasswordAndConfirmPasswordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email address!`
  String get errorEmailAddressInvalid {
    return Intl.message(
      'Please enter valid email address!',
      name: 'errorEmailAddressInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid name!`
  String get errorNameInvalid {
    return Intl.message(
      'Please enter valid name!',
      name: 'errorNameInvalid',
      desc: '',
      args: [],
    );
  }

  /// `please Select Course`
  String get errorCourseNameEmpty {
    return Intl.message(
      'please Select Course',
      name: 'errorCourseNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Merit Rank!`
  String get errorMeritRankEmpty {
    return Intl.message(
      'Please enter Merit Rank!',
      name: 'errorMeritRankEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Cast!`
  String get errorCastEmpty {
    return Intl.message(
      'Please enter Cast!',
      name: 'errorCastEmpty',
      desc: '',
      args: [],
    );
  }

  /// `please enter City Name!`
  String get errorCityNameEmpty {
    return Intl.message(
      'please enter City Name!',
      name: 'errorCityNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter CountryName!`
  String get errorCountryNameEmpty {
    return Intl.message(
      'Please enter CountryName!',
      name: 'errorCountryNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Address!`
  String get errorAddressEmpty {
    return Intl.message(
      'Please enter Address!',
      name: 'errorAddressEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter PinCode!`
  String get errorPinCodeEmpty {
    return Intl.message(
      'Please enter PinCode!',
      name: 'errorPinCodeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter AnnualIncome!`
  String get errorAnnualIncomeEmpty {
    return Intl.message(
      'Please enter AnnualIncome!',
      name: 'errorAnnualIncomeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password cannot be the same as previous password`
  String get errorConfirmPasswordCannotBeSameAsPrevious {
    return Intl.message(
      'Confirm password cannot be the same as previous password',
      name: 'errorConfirmPasswordCannotBeSameAsPrevious',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<CMLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<CMLocalizations> load(Locale locale) => CMLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
