import 'package:intl/intl.dart';

class AppFormatters{
  /// Formats a DateTime into a readable string
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // e.g., 20-May-2025
  }

  /// Formats a number into US currency
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  /// Formats US phone numbers (10 or 11 digits) into readable format
  static String formatPhoneNumber(String phoneNumber) {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), ''); // Remove non-digits

    if (phoneNumber.length == 10) {
      // (123) 456-7890
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      // 1 (234) 567-8901
      return '${phoneNumber.substring(0, 1)} (${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    } else {
      // Return as-is if it doesn't match known formats
      return phoneNumber;
    }
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
  // Remove any non-digit characters
  String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Ensure the number has at least a country code and a few digits
  if (digitsOnly.length < 4) return phoneNumber;

  // Extract the country code (first 1–3 digits; using 2 as default)
  String countryCode = '+${digitsOnly.substring(0, 2)}';
  digitsOnly = digitsOnly.substring(2);

  // If it's +1 (USA/Canada), format differently
  if (countryCode == '+1' && digitsOnly.length >= 10) {
    return '$countryCode (${digitsOnly.substring(0, 3)}) '
           '${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6, 10)}';
  }

  // Generic grouping for international numbers (grouped by 2s after country code)
  final formattedNumber = StringBuffer('$countryCode ');
  int i = 0;

  while (i < digitsOnly.length) {
    int groupLength = 2;

    // Prevent going out of range
    int end = (i + groupLength < digitsOnly.length)
        ? i + groupLength
        : digitsOnly.length;

    formattedNumber.write(digitsOnly.substring(i, end));

    if (end < digitsOnly.length) {
      formattedNumber.write(' ');
    }

    i = end;
  }

  return formattedNumber.toString();
}

}
