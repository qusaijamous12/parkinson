
class AppRegex {
  static bool hasLowercase(String text) {
    RegExp regex = RegExp(r'[a-z]');
    return regex.hasMatch(text);
  }

  static bool hasUppercase(String text) {
    RegExp regex = RegExp(r'[A-Z]');
    return regex.hasMatch(text);
  }

  static bool hasSpecialCharacter(String text) {
    RegExp regex = RegExp(r'[^a-zA-Z0-9]');
    return regex.hasMatch(text);
  }

  static bool hasNumber(String text) {
    RegExp regex = RegExp(r'[0-9]');
    return regex.hasMatch(text);
  }

  static bool isAtLeast8Characters(String text) {
    return text.length >= 8;
  }

  static bool isValidEmail(String email) {
    RegExp regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return regex.hasMatch(email);
  }


}
