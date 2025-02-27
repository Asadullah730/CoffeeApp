import 'package:flutter/material.dart';

class CustomSelectButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CustomSelectButton({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 32,
      width: 71,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0XFF8D510A) : Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: isSelected ? const Color(0XFF8D510A) : Colors.grey,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
