extension StringValidation on String {
  Result isEmail() {
    if (this == null || this.isEmpty) {
      return Result(false, "Email cannot be empty");
    }
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(this)) {
      return Result(false, "Please input valid email");
    }
    return Result(true, null);
  }

  int complexity() {
    if (this == null || this.isEmpty) {
      return 0;
    } else {
      if (this.isUpperCase() &&
          this.isCharacter() &&
          this.isLowerCase() &&
          this.isNumber()) {
        return 3;
      } else if (this.isCharacter() &&
          this.isLowerCase() &&
          this.isUpperCase()) {
        return 2;
      } else if ((this.isLowerCase() || this.isUpperCase()) &&
          (!this.isNumber() || !this.isCharacter())) {
        return 1;
      } else {
        return 0;
      }
    }
  }

  bool isLowerCase() {
    if (this == null || this.isEmpty) {
      return false;
    }
    const pattern = r'^(?=.*?[a-z])';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(this)) {
      return false;
    }
    return true;
  }

  bool isUpperCase() {
    if (this == null || this.isEmpty) {
      return false;
    }
    const pattern = r'^(?=.*?[A-Z])';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(this)) {
      return false;
    }
    return true;
  }

  bool isNumber() {
    if (this == null || this.isEmpty) {
      return false;
    }
    const pattern = r'^(?=.*?[0-9])';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(this)) {
      return false;
    }
    return true;
  }

  bool isCharacter() {
    if (this == null || this.isEmpty) {
      return false;
    }
    const pattern = r'^.{9,}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(this)) {
      return false;
    }
    return true;
  }
}

class Result {
  bool indicator;
  String message;

  Result(this.indicator, this.message);
}
