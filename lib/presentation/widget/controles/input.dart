import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? obscureText;

  const InputField(
      {super.key,
      required this.label,
      this.validator,
      this.prefixIcon,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        hintText: label,
        prefixIcon: prefixIcon,
        errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
        // labelText: "dd",
        // prefixText: "ff",
        // helperText: "fff",
        // hintStyle: TextStyle(color: Colors.green),
        // helperStyle: const TextStyle(color: Colors.green),
        // counterStyle: const TextStyle(color: Colors.yellow),
        // counterText: "gg",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0,
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText ?? false,
    );
  }
}
