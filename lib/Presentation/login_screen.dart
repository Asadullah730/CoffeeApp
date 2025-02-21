import 'package:coffee_shop/Presentation/home_screen.dart';
import 'package:coffee_shop/Presentation/signup_screen.dart';
import 'package:coffee_shop/common/custom_button.dart';
import 'package:coffee_shop/common/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

          /// Foreground Content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
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
                  opacity: 0.8,
                ),
                const SizedBox(height: 10),
                const CustomTextField(
                  hint: 'Password',
                  opacity: 0.8,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.13),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomButton(
                    title: 'Login',
                    opacity: 0.8,
                    onPressed: () {
                      Get.to(() => HomeScreen());
                    }),

                /// Sign Up Option
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have an Account? ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    TextButton(
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
