class ValidationRules {
  static var emailValidation =
      RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static var phoneValidation = RegExp(r'^(?: [1-9])?[0-9]{10,12}$');
}
