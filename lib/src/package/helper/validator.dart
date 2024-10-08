import '../../localization/generated/l10n.dart';
import '../resorces/appConstance.dart';

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
  }
  if (!AppConstants.numberRegExp.hasMatch(value)) {
    return 'Invalid number format'; // Customize error message
  }
  return null;
}
