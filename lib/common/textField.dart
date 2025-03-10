import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final double opacity;
  final bool? obscureText;

  final FormFieldValidator<String>? validator; // Added validator parameter

  const CustomTextField({
    super.key,
    this.hint,
    this.obscureText,
    this.controller,
    this.opacity = 1.0,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.09,
      child: Opacity(
        opacity: opacity.clamp(0.0, 1.0),
        child: TextFormField(
          keyboardType: keyboardType,
          keyboardAppearance: Brightness.light,
          controller: controller,
          validator: validator,
          obscureText: obscureText ?? false,
          // Apply validator
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
