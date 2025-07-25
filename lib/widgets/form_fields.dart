import 'package:flutter/material.dart';


/// A styled text input for general use (supports password, email, etc.)
class AppTextFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final int? maxLength;
  final void Function(String)? onChanged;

  // ignore: use_super_parameters
  const AppTextFormField({
    Key? key,
    required this.label,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.maxLength,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      enabled: enabled,
      maxLength: maxLength,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
        
      ),
    );
  }
}

/// A dropdown selector
class AppDropdownFormField<T> extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Widget? prefixIcon;
  final bool enabled;

  // ignore: use_super_parameters
  const AppDropdownFormField({
    Key? key,
    required this.label,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: enabled ? onChanged : null,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

/// A date picker field
class AppDatePickerFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(DateTime)? onDateSelected;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool enabled;

  const AppDatePickerFormField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.onDateSelected,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.enabled = true,
  });

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
    );
    if (picked != null) {
      controller.text = "${picked.toLocal()}".split(' ')[0];
      if (onDateSelected != null) onDateSelected!(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? () => _pickDate(context) : null,
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          validator: validator,
          enabled: enabled,
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: const Icon(Icons.calendar_today),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

/// A numeric input field
class AppNumberFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enabled;
  final int? maxLength;
  final void Function(String)? onChanged;

  const AppNumberFormField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.enabled = true,
    this.maxLength,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      validator: validator,
      enabled: enabled,
      maxLength: maxLength,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class AppSearchFormField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool enabled;

  /// Optional width (defaults to 100% of parent)
  final double? width;
  final double? height;

  /// NEW: Alignment of the field (left, center, right)
  final Alignment alignment;

  const AppSearchFormField({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.enabled = true,
    this.width,
    this.height,
    this.alignment = Alignment.centerLeft, // default to left-aligned
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height?? 40,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: const Icon(Icons.search),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}


/// For longer text input
class AppMultilineFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int minLines;
  final int maxLines;
  final bool enabled;
  final void Function(String)? onChanged;

  const AppMultilineFormField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.minLines = 3,
    this.maxLines = 6,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      minLines: minLines,
      maxLines: maxLines,
      enabled: enabled,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
