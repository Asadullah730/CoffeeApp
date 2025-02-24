import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSelectButton extends StatelessWidget {
  final String text;
  final RxBool isSelected = false.obs; // Independent state for each button

  CustomSelectButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected.value =
            !isSelected.value; // Toggle selection for this button only
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.all(10),
          height: 32,
          width: 71,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: isSelected.value ? Color(0XFF8D510A) : Colors.grey,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected.value ? Color(0XFF8D510A) : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
