import 'package:flutter_dunimarket/config/constant/constants.dart';

class FormValidator {
  static String? validateEmail(String? emailInput) {
    if (emailInput == null || emailInput.isEmpty) {
      return 'Email is required';
    }

    final regExp = RegExp(emailPattern, caseSensitive: false);
    if (!regExp.hasMatch(emailInput)) return 'Invalid email format';
    return null;
  }

  static String? validatePassword(String? passwordInput) {
    if (passwordInput == null ||
        passwordInput.length < 8 ||
        passwordInput.isEmpty) {
      return 'Password is required';
    }

    final regex = RegExp(passwordPattern, caseSensitive: false);
    if (!regex.hasMatch(passwordInput)) {
      return '''Must contain at least 8 characters, including a letter and a number''';
    }
    return null;
  }

  static bool validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (password != confirmPassword) {
      return false;
    }
    return true;
  }

  static String? validateOTP(String? otp) {
    if (otp == null || otp.length != 6 || otp.isEmpty) {
      return 'OTP is required';
    }
    final regex = RegExp(otpPattern, caseSensitive: false);
    if (!regex.hasMatch(otp)) {
      return 'Invalid OTP format';
    }
    return null;
  }

  static String? validateForgetPasswordEmail(String? email) {
    return validateEmail(email); // Reuse the email validation logic
  }
}
