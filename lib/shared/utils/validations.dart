enum ValidationResultPassword {
  valid,
  empty,
  endsWithSpace,
  hasSpecialCharacters,
  tooShort,
}

enum ValidationResultLogin {
  valid,
  empty,
  endsWithSpace,
}

class Validation {
  static ValidationResultLogin validateLogin(String text) {
    if (text.isEmpty) {
      return ValidationResultLogin.empty;
    } else if (text.endsWith(' ')) {
      return ValidationResultLogin.endsWithSpace;
    } else {
      return ValidationResultLogin.valid;
    }
  }

  static ValidationResultPassword   validatePassword(String text) {
    if (text.isEmpty) {
      return ValidationResultPassword.empty;
    } else if (text.endsWith(' ')) {
      return ValidationResultPassword.endsWithSpace;
    } else if (text.contains(RegExp(r'[\W_]+'))) {
      return ValidationResultPassword.hasSpecialCharacters;
    } else if (text.length < 2) {
      return ValidationResultPassword.tooShort;
    } else {
      return ValidationResultPassword.valid;
    }
  }
}
