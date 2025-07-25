class AppValidator {

  // Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null; // Valid email
  }

  // Validate Password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null; // Valid password
  }

  // Validate Phone Number (10-digit format)
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }

    return null; // Valid phone number
  }

  // Validate Username (e.g., alphanumeric and length constraints)
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required.';
    }

    // Ensure username is at least 3 characters and only contains alphanumeric characters
    final usernameRegExp = RegExp(r'^[a-zA-Z0-9]{3,}$');
    if (!usernameRegExp.hasMatch(value)) {
      return 'Username must be at least 3 characters long and contain only alphanumeric characters.';
    }

    return null; // Valid username
  }

  // Validate URL
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required.';
    }

    // Regular expression for simple URL validation
    final urlRegExp = RegExp(r'^(https?|ftp)://[^\s/$.?#].[^\s]*$');
    if (!urlRegExp.hasMatch(value)) {
      return 'Invalid URL format.';
    }

    return null; // Valid URL
  }

  // Validate Date (format: dd-MM-yyyy)
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date is required.';
    }

    // Regular expression for date format (dd-MM-yyyy)
    final dateRegExp = RegExp(r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-\d{4}$');
    if (!dateRegExp.hasMatch(value)) {
      return 'Invalid date format (dd-MM-yyyy).';
    }

    return null; // Valid date
  }

  // Validate Address
  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required.';
    }

    // Ensure address is at least 5 characters long
    if (value.length < 5) {
      return 'Address must be at least 5 characters long.';
    }

    return null; // Valid address
  }
}
