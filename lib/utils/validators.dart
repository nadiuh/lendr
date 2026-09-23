import '../constants/app_strings.dart';

/// Form validation utility for the Lendr application.
class Validators {
  Validators._();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Validates that full name is not empty
  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.errorEmptyFullName;
    }
    return null;
  }

  /// Validates email presence and standard format
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.errorEmptyEmail;
    }
    final trimmed = value.trim();
    if (!_emailRegExp.hasMatch(trimmed)) {
      return AppStrings.errorInvalidEmail;
    }
    return null;
  }

  /// Validates password presence
  static String? validatePassword(String? value, {bool isCreate = false}) {
    if (value == null || value.isEmpty) {
      return isCreate
          ? AppStrings.errorEmptyCreatePassword
          : AppStrings.errorEmptyPassword;
    }
    return null;
  }

  /// Validates confirm password presence and match with password
  static String? validateConfirmPassword(
    String? confirmPassword,
    String? originalPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return AppStrings.errorEmptyConfirmPassword;
    }
    if (confirmPassword != originalPassword) {
      return AppStrings.errorPasswordMismatch;
    }
    return null;
  }
}
