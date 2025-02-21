import 'package:coffee_shop/Presentation/login_screen.dart';
import 'package:coffee_shop/Presentation/signup_screen.dart';
import 'package:coffee_shop/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 20, 22),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "Assets/images/background_image.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Image(
                    image:
                        AssetImage("Assets/images/game-icons_coffee-beans.png"),
                  ),
                ),
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Find the best coffee",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Text(
                          "for you",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      title: "Get Started",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
