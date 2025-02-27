import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double opacity;
  final Color? color;
  final Color? textColor;
  final double height, width;
  final double? fontsize;
  final FontWeight? fontWeight;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.opacity = 1,
    this.color,
    this.textColor,
    this.height = 60,
    this.width = 240,
    this.fontsize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: fontsize ?? 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
