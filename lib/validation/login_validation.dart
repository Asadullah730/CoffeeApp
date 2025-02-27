class LoginValidation {
  String? emailValidation(String email) {
    if (email.isEmpty) {
      print("Email cannot be empty");
      return 'please Fill the Email Field';
    }

    // Regular expression for email validation
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(email)) {
      return 'email is Invalid';
    } else {
      return null;
    }
  }

  String? userNameValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    } else if (value.length < 2) {
      return 'Username must be at least 2 characters long';
    } else if (!RegExp(r'^[a-zA-Z0-9_ ]+$').hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null; // Valid input
  }
}
