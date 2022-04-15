class ValdiationMixin {
  String? validateEmail(String? value) {
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Enter an email address';
    }
    else if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Password is required';
    }
    else if (!regex.hasMatch(value) && value.length < 8) {
      return '''Password must be at least 8 characters long,include an uppercase letter ,number and symbol''';
    }
    return null;
  }
}
