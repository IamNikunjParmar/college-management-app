import '../../localization/generated/l10n.dart';
import '../resorces/app_constance.dart';

String? validateFullName(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) return CMLocalizations.current.errorNameEmpty;
  if (!AppConstants.namePatternRegExp.hasMatch(value)) return CMLocalizations.current.errorNameInvalid;
  return null;
}

String? validateEmailAddress(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) return CMLocalizations.current.errorEmailAddressEmpty;
  if (!AppConstants.emailPatternRegExp.hasMatch(value)) {
    return CMLocalizations.current.errorEmailAddressInvalid;
  }
  return null;
}

String? validatePassword(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) return CMLocalizations.current.errorPasswordEmpty;
  if (!AppConstants.passwordPatternRegExp.hasMatch(value)) {
    final errors = [
      if (value.length < 8) CMLocalizations.current.errorPasswordMinimumLength,
      CMLocalizations.current.errorPasswordSupportedCharacters,
    ];
    return errors.join("\n");
  }
  return null;
}

String? validateEmptyPassword(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return "Please Enter Password";
  }
  return null;
}

String? validateConfirmPassword(String? value, String password) {
  value = value?.trim() ?? "";
  if (value.isEmpty) return CMLocalizations.current.errorConfirmPasswordEmpty;
  if (password != value.trim()) return CMLocalizations.current.errorPasswordAndConfirmPasswordNotMatch;
  return null;
}

String? validateNumber(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return 'Please enter a number'; // Customize error message
  } else if (value.length < 10) {
    return 'Mobile no length mini 10';
  }
  if (!AppConstants.numberRegExp.hasMatch(value)) {
    return 'Invalid number format'; // Customize error message
  }
  return null;
}

String? validateCourseName(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return CMLocalizations.current.errorCourseNameEmpty;
  }
  return null;
}

String? validateMeritRank(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return CMLocalizations.current.errorMeritRankEmpty;
  }
  return null;
}

String? validateCast(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return CMLocalizations.current.errorCastEmpty;
  }
  return null;
}

String? validateCityName(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return CMLocalizations.current.errorCityNameEmpty;
  }
  return null;
}

String? validateCountryName(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return CMLocalizations.current.errorCountryNameEmpty;
  }
  return null;
}

String? validateAddress(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return CMLocalizations.current.errorAddressEmpty;
  }
  return null;
}

String? validatePinCode(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return CMLocalizations.current.errorPinCodeEmpty;
  }
  return null;
}

String? validateAnnualIncome(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return CMLocalizations.current.errorAnnualIncomeEmpty;
  }
  return null;
}

String? validateOtp(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return 'Please enter OTP';
  } else if (value.length != 6) {
    return 'OTP length must be 6';
  }
  return null;
}

String? validateRound(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return 'Please enter round';
  }

  // Check if the value can be parsed as an integer
  if (int.tryParse(value) == null) {
    return 'Round must be an integer';
  }

  return null;
}
