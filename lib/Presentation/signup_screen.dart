import 'package:coffee_shop/Presentation/login_screen.dart';
import 'package:coffee_shop/common/custom_button.dart';
import 'package:coffee_shop/common/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "Assets/images/background_image.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image:
                      AssetImage("Assets/images/game-icons_coffee-beans.png"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                const CustomTextField(
                  hint: 'UserName',
                  opacity: 0.75,
                ),
                const CustomTextField(
                  hint: 'Email',
                  opacity: 0.75,
                ),
                const CustomTextField(
                  hint: 'Password',
                  opacity: 0.75,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                CustomButton(
                  title: 'Sign Up',
                  opacity: 0.75,
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
